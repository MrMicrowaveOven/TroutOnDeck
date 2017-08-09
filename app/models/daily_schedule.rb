require 'open-uri'
require 'json'

class DailySchedule < ApplicationRecord
  def self.update_schedule
    response = open('https://api.sportradar.us/mlb-t6/games/2017/8/8/schedule.json?api_key=' + ENV['SPORTRADAR_KEY']).read
    games = (JSON.parse(response))["games"]
    angelsGames = games.select {|game| game["home_team"] == "4f735188-37c8-473d-ae32-1f7e34ccf892" || game["away_team"] == "4f735188-37c8-473d-ae32-1f7e34ccf892"}
    angelsGames.each do |angelGame|
      todaysSchedule = DailySchedule.new({
        "game_id": angelGame["id"],
        "game_time": angelGame["scheduled"]
      })
      todaysSchedule.save!
    end
    Commentator.send_schedule_update
    # gameStatus == "inprogress"
  end
end
