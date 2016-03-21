class TokensController < ApplicationController
  skip_before_action :check_for_token

  def index
    @user = current_user
  end


end
