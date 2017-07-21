class EmailsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    UserMailer.welcome_email.deliver_now
    render json: email_params["to"]
  end

  private
  def email_params
    params.require(:email).permit(:to, :from, :content, :subject)
  end
end
