class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all.order('taggings_count desc')
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @users = User.tagged_with(@tag.name)
    @tags = ActsAsTaggableOn::Tag.all.order('taggings_count desc')
  end

  def flag
    @flagged_tag = Tag.find(params[:id])
    if Flag.create(flagged: @flagged_tag, user: current_user)
      redirect_to :back, notice: "Flagged this Tag"
    else
      redirect_to :back, notice: "Flagging didn't work"
    end
  end
end

# @q =  ActsAsTaggableOn::Tag.ransack(params[:q])
#   if params[:q]
#     @tags = @q.result.distinct.page(params[:page]).per(10)
#     @q.build_condition if @q.conditions.empty?
#     @q.sorts = 'created_at desc' if @q.sorts.empty?
#   else
#     @tags = ActsAsTaggableOn::Tag.all
#   end
#
#   def search
#     index
#     render :index
#   end
# end
