class TwilioWorker
  include Sidekiq::Worker

  def perform(message)
    CLIENT.account.messages.create(message)
  end
end