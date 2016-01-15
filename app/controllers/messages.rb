get '/' do
  erb :index
end

get "/messages" do
  erb :"messages/new"
end

post "/messages" do
  TwilioWorker.perform_in(convert_to_seconds(params[:time]).seconds, params[:message])
  redirect "/"
end
