class AddVerification < ActiveRecord::Migration[5.2]
  def change

  	add_column :properties, :verification, :boolean
  end
end
