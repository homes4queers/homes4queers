class AddNotificationsOptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notification, :boolean
  end
end
