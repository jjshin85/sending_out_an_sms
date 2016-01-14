
get '/' do

  'Hello World! Currently running version ' + Twilio::VERSION + \
    ' of the twilio-ruby library.'

end

get "/messages" do
  erb :"messages/new"
end

post "/messages" do
  puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  CLIENT.account.messages.create(params[:message])
end


