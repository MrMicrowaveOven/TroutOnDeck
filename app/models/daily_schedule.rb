require 'open-uri'
require 'json'
require 'date'
require 'rest_client'

class DailySchedule < ApplicationRecord
  include CommentatorHelper
  include StadiumHelper
  def self.update_schedule
    current_date = Time.zone.now
    current_year = current_date.year
    current_month = current_date.month
    current_day = current_date.day

    begin
      api_url = 'https://api.sportradar.us/mlb-t6/games/' + current_year.to_s + '/' + current_month.to_s + '/' + current_day.to_s + '/schedule.json?api_key=' + ENV['SPORTRADAR_KEY']
      site = RestClient::Resource.new(api_url)
      response = site.get(content_type: 'application/json')
    rescue RestClient::Exception => exception
      p "=======================SPORTRADARERROR======================="
      p exception
    end
    games = (JSON.parse(response))["games"]
    angelsGames = games.select {|game| game["home_team"] == "4f735188-37c8-473d-ae32-1f7e34ccf892" || game["away_team"] == "4f735188-37c8-473d-ae32-1f7e34ccf892"}
    games = []
    angelsGames.each do |angelGame|
      todaysSchedule = DailySchedule.new({
        "game_id": angelGame["id"],
        "game_time": angelGame["scheduled"]
      })
      games << {game_time: angelGame["scheduled"], game_id: angelGame["id"]}
      todaysSchedule.save!
    end
    # Commentator.send_schedule_update
    p "++++++++++"
    p games
    games.each {|game| Stadium.new(game[:game_time], game[:game_id])}
  end
end
