class DeleteRoles < ActiveRecord::Migration[5.2]
  def change

  	remove_column :users, :admin
  	remove_column :users, :moderator
  	remove_column :users, :customer
  end
end
