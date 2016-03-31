module UsersHelper

  def favourite_button(user)
    unless current_user.favourite_users.exists?(user.id)
      link_to content_tag(:i, "favorite", class: "material-icons fave", alt: "favourite button", data: {disable_with: "blaaaah"}),
      favourite_user_path(user.id),
      method: :post,
      remote: true
    else
      link_to content_tag(:i, "favorite", class: "material-icons unfave", alt: "unfavourite button"),
      unfavourite_user_path(user.id),
      method: :delete,
      remote: true
    end
  end

end
