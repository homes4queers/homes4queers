class AddAttributesColumnsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :utilities_included, :boolean
    add_column :listings, :space_type, :string
    add_column :listings, :current_roommates, :integer
    add_column :listings, :wheelchair_accessible, :boolean
    add_column :listings, :visually_accessible, :boolean
    add_column :listings, :hearing_accessible, :boolean
    add_column :listings, :assistance_animal, :boolean
    add_column :listings, :fridge, :boolean
    add_column :listings, :stove, :boolean
    add_column :listings, :dishwasher, :boolean
    add_column :listings, :microwave, :boolean
    add_column :listings, :bathtub, :boolean
    add_column :listings, :fireplace, :boolean
    add_column :listings, :ac, :boolean
    add_column :listings, :electric_heat, :boolean
    add_column :listings, :forced_air_heat, :boolean
    add_column :listings, :boiler_system, :boolean
    add_column :listings, :cats, :boolean
    add_column :listings, :dogs, :boolean
    add_column :listings, :small_pets, :boolean
    add_column :listings, :ensuite_laundry, :boolean
    add_column :listings, :shared_laundry, :boolean
    add_column :listings, :coinop_laundry, :boolean
    add_column :listings, :balcony, :boolean
    add_column :listings, :deck, :boolean
    add_column :listings, :yard_shared, :boolean
    add_column :listings, :yard_private, :boolean
    add_column :listings, :pool, :boolean
    add_column :listings, :exercise_room, :boolean
    add_column :listings, :party_room, :boolean
    add_column :listings, :furnished, :boolean
    add_column :listings, :parking, :boolean
    add_column :listings, :on_street_parking, :boolean
    add_column :listings, :smoking, :boolean
    add_column :listings, :nonsmoking, :boolean
    add_column :listings, :flagged, :boolean
  end
end
