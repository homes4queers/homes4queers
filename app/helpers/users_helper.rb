module UsersHelper

  def favourite_button(user)
    unless current_user.id == user.id
    user = user.id
      unless current_user.favourite_users.exists?(user)
        link_to content_tag(:i, "favorite", class: "material-icons fave", alt: "favourite button" ),
        favourite_user_path(user),
        method: :post,
        remote: true
      else
        link_to content_tag(:i, "favorite", class: "material-icons unfave", alt: "unfavourite button"),
        unfavourite_user_path(user),
        method: :delete,
        remote: true
      end
    end
  end

end
