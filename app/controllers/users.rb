get '/users' do
  @users = User.all
  erb :"users/index"
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
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
