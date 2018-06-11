class CreateHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hosts do |t|
      t.timestamps null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      # t.integer :date_of_birth, , null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
    end

    add_index :hosts, :email
    add_index :hosts, :remember_token
  end
end
