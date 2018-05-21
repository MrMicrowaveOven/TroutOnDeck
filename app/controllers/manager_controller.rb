require 'open-uri'
require 'json'

class ManagerController < ApplicationController
  skip_before_action :verify_authenticity_token
  include ManagerHelper

  def create
    jsonResponse = ManagerHelper.send_text_if_valid(params[:gameId])

    render json: jsonResponse
  end
end
