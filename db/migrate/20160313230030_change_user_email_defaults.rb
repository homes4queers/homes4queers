class ChangeUserEmailDefaults < ActiveRecord::Migration
  def change
    change_column_default( :users, :email, null: true)
  end
end
