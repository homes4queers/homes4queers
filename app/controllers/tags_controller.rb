class TagsController < ApplicationController
  def index
      @q = Tag.ransack(params[:q])
      if params[:q]
        @listings = @q.result.distinct.page(params[:page]).per(10)
        @q.build_condition if @q.conditions.empty?
        @q.sorts = 'created_at desc' if @q.sorts.empty?
        # @listings = Listing.near(params[:q])
      elsif params[:latitude] && params[:longitude]
        @listings = Listing.near([params[:latitude], params[:longitude]])
      else
        @listings = Listing.order("created_at DESC").page(params[:page]).per(3)
        #  @listings = Listing.order("created_at DESC").page(params[:page])
      end
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @users = User.tagged_with(@tag.name)
  end
end

def index
  @q = Listing.ransack(params[:q])


  def search
    index
    render :index
  end
  # respond_to do |format|
  #   format.html
  #   format.js
  # end
end
