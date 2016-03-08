class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :listings, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourite_listings, through: :favourites, source: :favourited, source_type: 'Listing'
  has_many :favourite_users, through: :favourites, source: :favourited, source_type: 'User'
  has_many :conversations, dependent: :destroy
  has_many :messages, through: :conversations, dependent: :destroy
  has_many :user_comments, as: :commentable, class_name:"Comment", dependent: :destroy
  has_many :listing_comments, through: :listings, source:"comments", dependent: :destroy
  acts_as_ordered_taggable
  mount_uploader :avatar, ImageUploader

  validates :password, length: { minimum: 6}, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true

end