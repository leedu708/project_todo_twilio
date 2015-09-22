class Texter < ActiveRecord::Base

  def initialize

    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

  end

  def send_sms(todo, due_date)

    date = due_date.to_date

    message = "#{todo} is due #{date}."

    @client.messages.create(
        from: '+13479055956',
          to: '+13477533433',
        body: message
    )

  end

end
