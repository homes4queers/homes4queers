class Notification < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :messages
    end
  end
end
