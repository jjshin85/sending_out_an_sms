get '/requests' do
  @requests = Request.all
  erb :"requests/index"
end

post '/requests' do
  @request = Request.new(params[:request])
  if @request.save
    session[:request_id] = @request.id
    redirect "/requests/#{@request.id}"
  else
    erb :'users/new'
  end
end

get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  if current_user
    @user = User.find(params[:id])
    erb :"users/show"
  else
    redirect :"/login"
  end
end
