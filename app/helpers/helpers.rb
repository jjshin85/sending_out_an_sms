def current_user
  @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
end

def convert_to_seconds(hash)
  hours = hash[:hours].to_i * 3600
  minutes = hash[:minutes].to_i * 60
  seconds = hash[:seconds].to_i
  total = hours + minutes + seconds
end