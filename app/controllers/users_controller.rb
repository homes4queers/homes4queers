  class UsersController < ApplicationController
  before_action :require_login, only: [:index, :edit, :update, :destroy]
  skip_before_action :check_for_token, only: [:new, :create, :edit, :update]
  def index
    @q = User.ransack(params[:q])
    @tags = ActsAsTaggableOn::Tag.all.order('taggings_count desc')
    if params[:q]
      @users = @q.result.distinct.page(params[:page]).per(10)
      @q.build_condition if @q.conditions.empty?
      @q.sorts = 'created_at desc' if @q.sorts.empty?
      # results
    else
     @users = User.order("created_at DESC").page(params[:page]).per(8)
    end

  end

  def search
    index
    render :index
  end

  def new
    @user = User.new
  end

  def show
    @commentable = User.find(params[:id])
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
      @user = User.new(user_params)

      if @user.save
        auto_login(@user)
        redirect_to user_path(@user)
      else
        render :new
      end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_back_or_to listings_path
  end

  def favourite
    @user = User.find(params[:id])
     Favourite.create(favourited: @user, user: current_user)
      # redirect_to :back, notice: "Added to favourites"
    # else
      # redirect_to :back, alert: "Something went wrong, better blame the developers"
      respond_to do |format|
        format.js {render 'favourite.js.erb' }
        format.html {redirect_to :back}
      end
      # if request.xhr?
      #   head :ok
      # else
      #   redirect_to :back
      # end
    # end
  end

  def unfavourite
    @user = User.find(params[:id])
    Favourite.where(favourited_id: @user.id, user_id: current_user.id).first.delete
    respond_to do |format|
      format.js {render 'favourite.js.erb'}
      format.html {redirect_to :back}
    end
    #
    # if request.xhr?
    #   head :ok
    # else
    #   redirect_to :back
    # end
  end

  def flag
    @flagged_user = User.find(params[:id])
    if Flag.create(flagged: @flagged_user, user: current_user)
      redirect_to :back, notice: "Flagged this person"
    else
      redirect_to :back, notice: "Flagging didn't work"
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :about_me, :avatar, :tag_list, :invite_code, :message_notifications, :site_use, authentication_attributes: [:user_id, :provider, :uid])
  end

end
