require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC807bb5e2a8247b3d1dc56f18e6a998ce'
auth_token = '3ed1a743347ada915f6ede1c4917f601'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => '+18722398382',
  :to => '+12672290795',
  :body => 'Kevin you are my favorite!',
})