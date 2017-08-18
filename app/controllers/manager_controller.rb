require 'open-uri'
require 'json'

class ManagerController < ApplicationController
  skip_before_action :verify_authenticity_token
  include ManagerHelper

  def create
    game_id = params[:gameId]


    batboy = BatBoy.new(game_id)
    gameInProgress = batboy.game_going_on?

    jsonResponse = {
      gameInProgress: gameInProgress,
      textSentRecently: Alert.text_sent_recently?,
      troutAtBat: batboy.trout_at_bat?,
      troutOnDeck: batboy.trout_on_deck?
    }

    if gameInProgress && !jsonResponse[:textSentRecently]
      if jsonResponse[:troutAtBat] || jsonResponse[:troutOnDeck]
        marked_time = Alert.new
        marked_time.save!
        Commentator.send_texts
      end
    end
    render json: jsonResponse
  end
end
