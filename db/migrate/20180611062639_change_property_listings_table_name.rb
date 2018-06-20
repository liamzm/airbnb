class ChangePropertyListingsTableName < ActiveRecord::Migration[5.2]
  def change
  	rename_table :property_listings, :properties
  end
end
