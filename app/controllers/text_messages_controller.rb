class TextMessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    # send_text_message("+7148099426", "Yo")

    # put your own credentials here

    account_sid = 'AC2f849325773a8d8bb652a418f772ea3c'
    auth_token = 'b6ad929d59deb307545ecd808d59f3f8'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    p "========================================="
    p @client
    p "========================================="
    p @client.accounts


    @client.messages.create({
      :from => '+15624554829',
      :to => '+17148099426',
      :body => 'Yo',
      # :media_url => 'https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg',
    })
    render json: "Yo"
  end

  def index
    render json: "Hello"
  end
end
