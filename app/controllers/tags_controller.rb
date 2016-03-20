class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all.order('taggings_count desc')
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @users = User.tagged_with(@tag.name)
    @tags = ActsAsTaggableOn::Tag.all.order('taggings_count desc')
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
