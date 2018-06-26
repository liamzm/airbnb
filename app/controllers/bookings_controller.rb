
class BookingsController < ApplicationController

	def new
		@property = Property.find(params[:property_id])
		@booking = Booking.new

		render template: "bookings/new"


	end


	def create 
		@property = Property.find(params[:property_id])
		@booking = @property.bookings.new(booking_params)
		@bookings = Booking.all
		current_user.bookings << @booking
		@user = @booking.user
		if @booking.save
			# ReservationJob.perform_later
			redirect_to booking_path(@booking.id)
		else
			@booking.errors.messages.each do |x, y|
				flash[x] = y[0]
		end
			render template: "bookings/new"
	end
end


	def show

		@booking = Booking.find(params[:id])
		@nights = (@booking.check_out_date.to_date - @booking.check_in_date.to_date).to_i
		@price = ((@booking.check_out_date.to_date - @booking.check_in_date.to_date).to_i) * @booking.property.price_per_night

	end

	# def booking_confirmed

	# 	render template: "bookings/:id/booking_confirmed"

	# end


	def booking_params
		params.require(:booking).permit(:check_in_date, :check_out_date)
	end
end

# params.require(:property).permit(:address, :city, :price_per_night, {images: []})
