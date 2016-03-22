class Flag < ActiveRecord::Base
  belongs_to :user

  belongs_to :flagged, polymorphic: true

end
