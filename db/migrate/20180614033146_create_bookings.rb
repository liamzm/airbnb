class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|

    	t.date :check_in_date
    	t.date :check_out_date
    	t.references :user
    	t.belongs_to :property
    	t.timestamps
    end
  end
end
