class TextAlert
  include Sidekiq::Worker

  def perform(phone_number, message)
    send(phone_number, message)
  end

  def send(phone_number, message)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    from = ENV['TWILIO_PHONE_NUMBER']

    client.api.account.messages.create(
    from: from,
    to: phone_number,
    body: message
    )
  end
end
