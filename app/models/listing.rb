class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :flags, as: :flagged
  has_many :images
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
  validates :price, presence: true
  validates :location, presence: true
  validates :rent_date, presence: true
  accepts_nested_attributes_for :images, allow_destroy: true

  def display_distance_in_meters(other_listing)
    self.distance_to(other_listing, :km).round(3)
  end

  def thumbnail
    if images.any?
      images.first.photo.thumb
    end
  end

  def thumb_url
    if images.any?
      images.first.photo.thumb.url
    end
  end

  def nearbys_if_geocoded
    if latitude && longitude
      self.nearbys(0.8, unit: :km)
    else
      []
    end
  end

end
