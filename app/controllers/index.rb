get '/' do
  erb :index
end

get "/messages" do
  erb :"messages/new"
end

post "/messages" do
  puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  CLIENT.account.messages.create(params[:message])
end



