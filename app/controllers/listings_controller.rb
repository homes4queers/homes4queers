class ListingsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  skip_before_action :check_for_token, only: [:index]
  def index
    @q = Listing.ransack(params[:q])
    if params[:q]
      @listings = @q.result.distinct.page(params[:page]).per(8)
      @q.build_condition if @q.conditions.empty?
      @q.sorts = 'created_at desc' if @q.sorts.empty?
      # @listings = Listing.near(params[:q])
    elsif params[:latitude] && params[:longitude]
      @listings = Listing.near([params[:latitude], params[:longitude]])
    else
      @listings = Listing.order("created_at DESC").page(params[:page]).per(8)
    #  @listings = Listing.order("created_at DESC").page(params[:page])
    end


  def search
    index
    render :index
    end
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end


  def new
    @listing = Listing.new
  end

  def show
    @listing = Listing.find(params[:id])
    @commentable = Listing.find(params[:id])
    @nearby_listings = @listing.nearbys_if_geocoded

  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user

    if @listing.save
      redirect_back_or_to listing_path(@listing), notice: 'Successfully created a listing!'
    else
      render :new
    end
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update_attributes(listing_params)
      redirect_to listing_path(@listing)
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  def favourite
    @listing = Listing.find(params[:id])
    Favourite.create(favourited: @listing, user: current_user)
    respond_to do |format|
      format.js {render 'favourite.js.erb' }
      format.html {redirect_to :back}
    end
  end

  def unfavourite
    @listing = Listing.find(params[:id])
    Favourite.where(favourited_id: @listing.id, user_id: current_user.id).last.destroy
    respond_to do |format|
      format.js {render 'favourite.js.erb' }
      format.html {redirect_to :back}
    end
  end

  def flag
    @flagged_listing = Listing.find(params[:id])
    if Flag.create(flagged: @flagged_listing, user: current_user)
      redirect_to :back, notice: "Flagged this listing"
    else
      redirect_to :back, notice: "Flagging didn't work"
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :location, :user_id, :roomates, :bedrooms, :price, :basement, :sublet, :rent_date,
    :utilities_included, :space_type, :current_roommates, :wheelchair_accessible, :visually_accessible, :hearing_accessible, :assistance_animal, :fridge, :stove, :dishwasher, :microwave, :bathtub, :fireplace, :ac, :electric_heat, :forced_air_heat, :boiler_system, :cats, :dogs, :small_pets, :ensuite_laundry, :shared_laundry, :coinop_laundry, :balcony, :deck, :yard_shared, :yard_private, :pool, :exercise_room, :party_room, :furnished, :parking, :on_street_parking, :smoking,
     images_attributes: [:photo])
  end

end
