
class BookingsController < ApplicationController

	def new
		@property = Property.find(params[:property_id])
		@booking = Booking.new

		render template: "bookings/new"


	end


	def create 
		@property = Property.find(params[:property_id])
		@booking = @property.bookings.new(booking_params)
		current_user.bookings << @booking
		if @booking.save
			redirect_to booking_path(:id)
		else
			render template: "bookings/new"
	end
end


	def show

	end


	def booking_params
		params.require(:booking).permit(:check_in_date, :check_out_date)
	end
end

# params.require(:property).permit(:address, :city, :price_per_night, {images: []})
