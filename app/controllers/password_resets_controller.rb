class PasswordResetsController < ApplicationController
  skip_before_filter :require_login
  skip_before_action :check_for_token

  def create
    @user = User.find_by_email(params[:email])

    @user.deliver_reset_password_instructions! if @user
    # binding.pry
    redirect_to root_path, notice: "We sent you some instructions on how to reset your password. Check your email!"
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
    end
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.change_password!(params[:user][:password])
      redirect_to user_path(@user), notice: "Password successfully changed"
    else
      render :edit
    end
  end
end
