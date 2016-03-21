class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_for_token

  def not_authenticated
    redirect_to login_path, notice: "You need to be logged in to do this"
  end

private

  def check_for_token
    unless current_user.invite_code?
      redirect_to tokens_path
    end
  end
end
