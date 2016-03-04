class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update, :destroy]

  def index
    @q = User.ransack(params[:q])

    if params[:q]
      @users = @q.result.distinct
      # results
    else
     @users = User.all
    end
  end

  # def results
  # @users = User.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%") \
  #   | User.tagged_with(params[:search])
  # end


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
      redirect_back_or_to user_path(@user)
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_back_or_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_back_or_to listings_path
  end

  private

  def user_params
    #image is nested in a hash
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :about_me, :avatar, :tag_list)
  end
end
