class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :site_use, :string
    add_column :users, :flagged, :boolean
  end
end
