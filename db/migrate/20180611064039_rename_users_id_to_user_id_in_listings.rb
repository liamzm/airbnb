class RenameUsersIdToUserIdInListings < ActiveRecord::Migration[5.2]
  def change
  	rename_column :properties, :users_id, :user_id
  	remove_column :users, :property_id
  end
end
