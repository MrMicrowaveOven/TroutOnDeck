require 'open-uri'
require 'json'

class ManagerController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    game_id = params["gameId"]

    jsonResponse = {}
    gameInProgress = BatBoy.game_going_on?(game_id)
    jsonResponse["gameInProgress"] = gameInProgress
    if gameInProgress
      current_time = Time.now
      last_alert = Alert.all.last
      if last_alert
        most_recent_alert_time = Alert.all.last.created_at
      else
        most_recent_alert_time = Time.new(2000,1,1)
      end
      # p most_recent_alert

      jsonResponse["textSentRecently"] = Time.now - most_recent_alert_time < 600
      if !jsonResponse["textSentRecently"]
        marked_time = Alert.new
        marked_time.save!
        Commentator.send_texts
      end
    end
    render json: jsonResponse
  end
end
