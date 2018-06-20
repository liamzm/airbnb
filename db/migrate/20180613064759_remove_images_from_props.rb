class RemoveImagesFromProps < ActiveRecord::Migration[5.2]
  def change
  	remove_column :properties, :images
  end
end
