class PropertiesController < ActionController::Base


	def index 
		byebug
		@properties = Property.page(params[:page]).per(10)
		# @user = User.find(params[:id])
	end

	def create
		@property = Property.new(property_params)
		if @property.save
			redirect_to property_path(@property)
		else
			render "new"
		end
	end

	def show
		@property = Property.find(params[:id])
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
		@user = User.find(params[:id])
		# byebug
		if @user.customer? == true 
        flash[:notice] = "Sorry. You are not allowed to perform this action."
        flash = {notice: "sorry..."}

        return redirect_to @property, notice: "Sorry. You do not have the permission to verify a property."
        else 
        	render "edit"
        end
	end

	private

	def property_params
		params.require(:property).permit(:address, :city, :price_per_night)
	end
end

