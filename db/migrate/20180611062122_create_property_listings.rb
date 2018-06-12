class CreatePropertyListings < ActiveRecord::Migration[5.2]
  def change
    create_table :property_listings do |t|

    	t.string :address, null: false
    	t.string :city, null: false
    	t.integer :price_per_night, null: false 
    	t.references :users
    end
  end
end
