require 'open-uri'
require 'json'

class ManagerController < ApplicationController
  include ManagerHelper
  skip_before_action :verify_authenticity_token

  def create
    game_id = params["gameId"]

    jsonResponse = {}

    batboy = BatBoy.new(game_id)
    gameInProgress = batboy.game_going_on?
    jsonResponse["gameInProgress"] = gameInProgress

    # jsonResponse["trout_at_bat"] = batboy.trout_at_bat?
    # jsonResponse["home_game?"] = batboy.are_angels_home?

    if gameInProgress
      current_time = Time.now
      last_alert = Alert.all.last
      if last_alert
        most_recent_alert_time = Alert.all.last.created_at
      else
        most_recent_alert_time = Time.new(2000,1,1)
      end

      jsonResponse["textSentRecently"] = Time.now - most_recent_alert_time < 600

      if !jsonResponse["textSentRecently"]
        # jsonResponse["trout_at_bat"] = batboy.trout_at_bat?
        marked_time = Alert.new
        marked_time.save!
        Commentator.send_texts
      end
    end
    render json: jsonResponse
  end
end
