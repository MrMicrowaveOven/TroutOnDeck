module CommentatorHelper
  class Commentator
    def self.send_schedule_update
      account_sid = ENV['TWILLIO_SID']
      auth_token = ENV['TWILLIO_TOKEN']

      # set up a client to talk to the Twilio REST API
      @client = Twilio::REST::Client.new account_sid, auth_token

      @client.messages.create({
        :from => '+16095287688',
        :to => '+17148099426',
        :body => 'Schedule has been updated!',
        # :media_url => 'https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg',
      })
      return "Update sent!"
    end

    def self.send_texts
      account_sid = ENV['TWILLIO_SID']
      auth_token = ENV['TWILLIO_TOKEN']

      # set up a client to talk to the Twilio REST API
      @client = Twilio::REST::Client.new account_sid, auth_token

      phone_numbers = [
        '+17148099426',
        '+17144868433',
        '+17148156295'
      ]

      phone_numbers.each do |phone_number|
        @client.messages.create({
          :from => '+16095287688',
          :to => phone_number,
          :body => 'Trout is on deck!',
        })
      end

    end
  end
end
