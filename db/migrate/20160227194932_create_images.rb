class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :photo
      t.belongs_to :imageable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
