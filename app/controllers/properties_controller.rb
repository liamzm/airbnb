class PropertiesController < ApplicationController


	def index
		@properties = Property.page(params[:page]).per(9)
		# @user = User.find(params[:id])
	end

	def new
		@property = Property.new
		# if @property.update(property_params)
		# 	redirect_to property_path(@property)
		# else
		# 	render template: "properties/new"
		render template: "properties/new"
		# end


	end

	def create
		@property = current_user.properties.new(property_params)
		if @property.save
			redirect_to property_path(@property)
		else
			render template: "properties/new"
			
		end
	end

	def show
		@property = Property.find(params[:id])
		@booking = Booking.new

		    # byebug
	end

	def update
		@property = Property.find(params[:id])
		if @property.update(property_params)
			redirect_to property_path(@property)
		else
			render "edit"
		end
	end

	def edit 
		@property = Property.find(params[:id])

	end


	def destroy
		@property = Property.find(params[:id])
		@property.destroy
		redirect_to '/properties'
	end


	def verify
		@property = Property.find(params[:id])
		@property.verified_status = true
		@property.save
		redirect_back(fallback_location: root_path)
	end

	private

	def property_params
		params.require(:property).permit(:name, :address, :city, :price_per_night, :bedrooms, {images: []})
	end
end

