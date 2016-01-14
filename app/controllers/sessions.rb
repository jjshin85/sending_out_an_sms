get '/login' do
  erb :"sessions/login"
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:username], params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = "Username or password is not valid."
    erb :"sessions/login"
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/session' do
  session.inspect
end