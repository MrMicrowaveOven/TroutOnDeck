require 'open-uri'
require 'json'

module ManagerHelper
end
class BatBoy
  def self.game_going_on?(game_id)
    response = open('https://api.sportradar.us/mlb-t6/games/' + game_id + '/pbp.json?api_key=' + ENV['SPORTRADAR_KEY']).read
    gameStatus = (JSON.parse(response))["game"]["status"]

    gameStatus == "inprogress"
  end
end

class Commentator
  def self.send_texts
    account_sid = ENV['TWILLIO_SID']
    auth_token = ENV['TWILLIO_TOKEN']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create({
      :from => '+15624554829',
      :to => '+17148099426',
      :body => 'Trout is on deck!',
      # :media_url => 'https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg',
    })
    @client.messages.create({
      :from => '+15624554829',
      :to => '+17144868433',
      :body => 'Trout is on deck!',
      # :media_url => 'https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg',
    })
    @client.messages.create({
      :from => '+15624554829',
      :to => '+17148156295',
      :body => 'Trout is on deck!',
      # :media_url => 'https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg',
    })
  end
end
