module ListingsHelper

  def listing_favourite_button(listing)
    unless current_user.id == listing.user_id
    listing = listing.id
      unless current_user.favourite_listings.exists?(listing)
        link_to content_tag(:i, "favorite", class: "material-icons fave", alt: "favourite button" ),
        favourite_listing_path(listing),
        method: :post,
        remote: true
      else
        link_to content_tag(:i, "favorite", class: "material-icons unfave", alt: "unfavourite button"),
        unfavourite_listing_path(listing),
        method: :delete,
        remote: true
      end
    end
  end
end
