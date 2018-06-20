class ChangeVerified < ActiveRecord::Migration[5.2]
  def change

  	rename_column :properties, :verified?, :verified_status
  end
end
