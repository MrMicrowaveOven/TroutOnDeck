require 'open-uri'
require 'json'
require 'date'

class DailySchedule < ApplicationRecord
  def self.update_schedule
    current_date = Date.today
    current_year = current_date.year
    current_month = current_date.month
    current_day = current_date.day
    response = open('https://api.sportradar.us/mlb-t6/games/' + current_year.to_s + '/' + current_month.to_s + '/' + current_day.to_s + '/schedule.json?api_key=' + ENV['SPORTRADAR_KEY']).read
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