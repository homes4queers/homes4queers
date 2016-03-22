class TokensController < ApplicationController
  skip_before_action :check_for_token

  def index
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(token_params)
      redirect_to root_path
    else
      redirect_to tokens_path
    end
  end

  private
  def token_params
    params.require(:user).permit(:invite_code)
  end
end
