class TextMessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    account_sid = ENV['TWILLIO_SID']
    auth_token = ENV['TWILLIO_TOKEN']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create({
      :from => '+15624554829',
      :to => '+17148099426',
      :body => 'Yo',
      # :media_url => 'https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg',
    })
    render json: "Text message sent to 17148099426"
  end

  def index
    render json: "Hello"
  end
end
