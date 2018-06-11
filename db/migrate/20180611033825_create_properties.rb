class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.timestamps 
      t.string :adress, null: false
      t.string :location, null: false
      t.string :city, null: false
      t.string :state_id, null: false
      t.string :country_id, null: false
      t.integer :price_per_night, null: false 
 	    t.belongs_to :hosts
    end  
  end
 end


