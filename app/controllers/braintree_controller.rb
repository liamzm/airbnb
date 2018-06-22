class BraintreeController < ApplicationController

  def new
  	@client_token = Braintree::ClientToken.generate
  	@booking = Booking.find(params[:id])
  end

  def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

	  @booking = Booking.find(params[:id])
	  @price = ((@booking.check_out_date.to_date - @booking.check_in_date.to_date).to_i) * @booking.property.price_per_night.to_i


	  result = Braintree::Transaction.sale(
	   :amount => ((@booking.check_out_date.to_date - @booking.check_in_date.to_date).to_i) * @booking.property.price_per_night.to_i,
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )

	  if result.success?
	  	@booking.payment_status = true
	  	@booking.save
	    redirect_to booking_path(@booking.id)
	  else
	    redirect_back(fallback_location: root_path)
	  end


	end

end
