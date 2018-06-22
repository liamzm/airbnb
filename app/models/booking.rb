class Booking < ApplicationRecord

	
	validates_presence_of :check_in_date, :check_out_date
	validate :check_overlapping_dates, if: :check_error
	validate :expiration_date_cannot_be_in_the_past
	validate :check_out_cannot_be_before_check_in



	belongs_to :property

	belongs_to :user

  	

	def expiration_date_cannot_be_in_the_past
	    if check_in_date.present? && check_in_date < Date.today
	      errors.add(:expiration_date, "Sorry, you can't choose a date in the past")
	    end
	end

	def check_out_cannot_be_before_check_in
		if check_out_date < check_in_date
			errors.add(:invalid_dates, "Sorry, your check-out date must come after your check-in date")
		end
	end



	def check_error
        self.errors.blank?
    end 


    def check_overlapping_dates
      property.bookings.each do |old_booking|
            if overlap?(self, old_booking)
                if self == old_booking
                    return true
                else
                    errors.add(:overlapping_dates, "Sorry, this property is unavailable for your selected dates.")
                end
            end
        end
    end

    def overlap?(x,y)
        if y.check_in_date != nil and y.check_out_date != nil
            (x.check_in_date - y.check_out_date).to_i * (y.check_in_date - x.check_out_date).to_i > 0
        end
    end
end



