
get '/sms-quickstart' do
  sender = params[:From]
  friends = {
    "+14153334444" => "Curious George",
    "+14158157775" => "Boots",
    "+14155551234" => "Virgil",
    "+17814136983" => "Becky"
  }
  name = friends[sender] || "Mobile Monkey"
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Hello, #{name}. Thanks for the message."
  end
  twiml.text
end