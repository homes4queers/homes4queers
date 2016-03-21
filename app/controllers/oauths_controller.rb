class OauthsController < ApplicationController
  skip_before_filter :require_login
  skip_before_action :check_for_token

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if @user = login_from(provider)
      redirect_to user_path(current_user)
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
          if current_user.invite_code == ""
            redirect_to tokens_path
          else
              redirect_to edit_user_path(current_user)
          end
      rescue
        redirect_to root_path, alert: "Failed to login from #{provider.titleize}"
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end

  def invite_code
    unless current_user.invite_code?
      redirect_to tokens_path
    end
  end
end
