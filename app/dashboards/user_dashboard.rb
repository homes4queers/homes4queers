require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    authentications: Field::HasMany,
    listings: Field::HasMany,
    favourites: Field::HasMany,
    favourite_listings: Field::HasMany.with_options(class_name: "Listing"),
    favourite_users: Field::HasMany.with_options(class_name: "User"),
    conversations: Field::HasMany,
    messages: Field::HasMany,
    user_comments: Field::HasMany.with_options(class_name: "Comment"),
    listing_comments: Field::HasMany.with_options(class_name: "Comment"),
    id: Field::Number,
    name: Field::String,
    about_me: Field::Text,
    email: Field::String,
    crypted_password: Field::String,
    salt: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    avatar: Field::String,
    remember_me_token: Field::String,
    remember_me_token_expires_at: Field::DateTime,
    failed_logins_count: Field::Number,
    lock_expires_at: Field::DateTime,
    unlock_token: Field::String,
    token: Field::String,
    invite_code: Field::String,
    role: Field::String,
    reset_password_token: Field::String,
    reset_password_token_expires_at: Field::DateTime,
    reset_password_email_sent_at: Field::DateTime,
    message_notifications: Field::Boolean,
    password: PasswordField,
    password_confirmation: PasswordField,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :listings,
    :user_comments,
    :listing_comments,
    :message_notifications
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :about_me,
    :email,
    :authentications,
    :listings,
    # :favourites,
    # :favourite_listings,
    # :favourite_users,
    :conversations,
    :messages,
    :user_comments,
    :listing_comments,
    # :crypted_password,
    # :salt,
    :created_at,
    :updated_at,
    :avatar,
    # :remember_me_token,
    # :remember_me_token_expires_at,
    # :failed_logins_count,
    # :lock_expires_at,
    # :unlock_token,
    :token,
    :invite_code,
    :role,
    # :reset_password_token,
    # :reset_password_token_expires_at,
    # :reset_password_email_sent_at,
    :message_notifications,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    # :authentications,
    :name,
    :about_me,
    :email,
    :password,
    :password_confirmation,
    :listings,
    # :favourites,
    # :favourite_listings,
    # :favourite_users,
    :conversations,
    :messages,
    :user_comments,
    :listing_comments,
    # :crypted_password,
    # :salt,
    :avatar,
    # :remember_me_token,
    # :remember_me_token_expires_at,
    # :failed_logins_count,
    :lock_expires_at,
    :unlock_token,
    :token,
    :invite_code,
    :role,
    :reset_password_token,
    :reset_password_token_expires_at,
    # :reset_password_email_sent_at,
    :message_notifications,
  ]

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "User #{user.name}"
  end
end
