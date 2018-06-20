class AddNewImagesColumn < ActiveRecord::Migration[5.2]
  def change
  	add_column :properties, :images, :json
  end
end
