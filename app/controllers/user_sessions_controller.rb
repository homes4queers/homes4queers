class UserSessionsController < ApplicationController
  skip_before_action :check_for_token
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember])
      redirect_back_or_to user_path(current_user)
    else
      flash.now[:alert] = 'Login failed'
      render :new
    end
  end


  def destroy
    logout
    redirect_to root_path, notice: 'Logged Out'
  end
end
