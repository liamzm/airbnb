class AddUserIdToProperties < ActiveRecord::Migration[5.2]
  def change

  	add_reference :properties, :user, index: true
  end
end
