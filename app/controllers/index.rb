get '/' do
  erb :index
end

get "/messages" do
  erb :"messages/new"
end

post "/messages" do
  puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  puts "message sent"
  SCHEDULER.in 1m do
    CLIENT.account.messages.create(params[:message])
  end
end



