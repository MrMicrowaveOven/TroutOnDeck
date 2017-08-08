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
      Commentator.send_texts
    end
    render json: jsonResponse
  end
end
