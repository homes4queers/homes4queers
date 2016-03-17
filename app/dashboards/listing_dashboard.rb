require "administrate/base_dashboard"

class ListingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    comments: Field::HasMany,
    images: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    location: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    bedrooms: Field::Number,
    roomates: Field::Boolean,
    rent_date: Field::DateTime,
    price: Field::Number,
    basement: Field::Boolean,
    sublet: Field::Boolean,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :comments,
    :images,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :comments,
    :images,
    :id,
    :name,
    :description,
    :location,
    :created_at,
    :updated_at,
    :latitude,
    :longitude,
    :bedrooms,
    :roomates,
    :rent_date,
    :price,
    :basement,
    :sublet,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :comments,
    :images,
    :name,
    :description,
    :location,
    :latitude,
    :longitude,
    :bedrooms,
    :roomates,
    :rent_date,
    :price,
    :basement,
    :sublet,
  ]

  # Overwrite this method to customize how listings are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(listing)
  #   "Listing ##{listing.id}"
  # end
end
