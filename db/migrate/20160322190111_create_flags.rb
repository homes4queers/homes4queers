class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.references :flagged, polymorphic: true, index: true
      t.references :user, index: true, foregin_key: true
      t.timestamps null: false
    end
  end
end
