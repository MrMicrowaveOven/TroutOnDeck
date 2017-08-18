require 'open-uri'
require 'json'

class ManagerController < ApplicationController
  skip_before_action :verify_authenticity_token
  include ManagerHelper

  def create
    game_id = params[:gameId]

    jsonResponse = {}

    batboy = BatBoy.new(game_id)
    gameInProgress = batboy.game_going_on?
    jsonResponse[:gameInProgress] = gameInProgress

    # jsonResponse[:trout_at_bat] = batboy.trout_at_bat?
    # jsonResponse[:home_game?] = batboy.angels_home_game?

    if gameInProgress
      jsonResponse[:textSentRecently] = Alert.text_sent_recently

      if !jsonResponse[:textSentRecently]
        # jsonResponse[:trout_at_bat] = batboy.trout_at_bat?
        marked_time = Alert.new
        marked_time.save!
        Commentator.send_texts
      end
    end
    render json: jsonResponse
  end
end
