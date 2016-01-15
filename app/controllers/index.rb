get '/' do
  erb :index
end

get "/messages" do
  erb :"messages/new"
end

post "/messages" do
    SCHEDULER.in "10s" do
    CLIENT.account.messages.create(params[:message])
  end
end


