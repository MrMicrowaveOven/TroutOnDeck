class AlertsController < ApplicationController
  def index
    render json: Alert.all
  end
end
