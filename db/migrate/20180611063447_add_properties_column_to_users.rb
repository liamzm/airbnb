class AddPropertiesColumnToUsers < ActiveRecord::Migration[5.2]
  def change

  	add_column :users, :property_id, :integer
  end
end
