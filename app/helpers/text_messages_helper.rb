module TextMessagesHelper
  require 'twilio-ruby'
  def send_text_message(phone_number, message)

    # put your own credentials here
    account_sid = 'AC2f849325773a8d8bb652a418f772ea3c'
    auth_token = 'b6ad929d59deb307545ecd808d59f3f8'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.accounts.messages.create({
      :from => '+5624554829',
      :to => '+7148099426',
      :body => 'Yo',
      # :media_url => 'https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg',
    })
  end
end
