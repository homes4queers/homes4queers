class FlagsController < ApplicationController
  def index
    @flagged_tags = Flag.where(flagged_type = "Tags")
    @flagged_listings = Flag.where(flagged_type = "Listings")
    @flagged_users = Flag.where(flagged_type = "Users")
    @flagged_conversations = Flag.where(flagged_type = "Conversations")
  end

end
