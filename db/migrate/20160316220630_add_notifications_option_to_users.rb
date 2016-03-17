class AddNotificationsOptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :message_notifications, :boolean
  end
end
