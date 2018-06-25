class ReservationMailer < ApplicationMailer

	def reservation_email(user)
      
      @user = user
      # @property = property
      # @property.user = host
      # booking_id = @booking.id

      mail(to: @user.email, subject: 'Booking confirmed')


	end


end