class DailySchedulesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    DailySchedule.update_schedule
  end

  def index
    render json: DailySchedule.all
  end
end
