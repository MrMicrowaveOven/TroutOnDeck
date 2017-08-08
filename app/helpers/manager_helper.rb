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
