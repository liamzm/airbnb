class ReservationJob < ActiveJob::Base
  queue_as :default

  	def booking_email(user_id)
    @user = User.find(user_id)

    mail(   :to      => @user.email,
            :subject => "Your Booking is confirmed"
    ) do |format|
      format.text
      format.html
    end
  end
end
