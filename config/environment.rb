# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'
require 'bcrypt'

require 'pg'
require 'active_record'
require 'logger'

require 'twilio-ruby'
require 'sinatra'
require "sinatra/reloader" if development?
require 'rufus-scheduler'

require 'erb'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

AUTH_TOKEN = "08ae13cdabed63a3a86b2b8ad999465a"
ACCOUNT_SID = "ACaccfb5268cb23b1d2daa4f556e6ba64a"
TWILIO_ROOT_PATH = "/2010-04-01/Accounts/"

configure do
  # By default, Sinatra assumes that the root is the file that calls the configure block.
  # Since this is not the case for us, we set it manually.
  set :root, APP_ROOT.to_path
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'Like, for realz'

  # Set the views to
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

CLIENT = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
SCHEDULER = Rufus::Scheduler.new

Twilio.configure do |config|
  config.account_sid = "ACaccfb5268cb23b1d2daa4f556e6ba64a"
  config.auth_token = "08ae13cdabed63a3a86b2b8ad999465a"
end


# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')
