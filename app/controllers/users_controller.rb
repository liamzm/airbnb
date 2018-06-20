class UsersController < Clearance::UsersController

	# def image_params
 #  		params.require(:image).permit(:image)
	# end
	# def create
	# end

  def new
    @user = User.new
    render template: "users/new"
  end

  def create
    @user = User.new(user_params)
    # byebug
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
      # @user.errors 
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      
      redirect_to user_path(@user)
      flash.now[:notice] = 'Your Account Has Been Successfully Updated'
    else
      render "edit"
    end
  end

  def show
    # @user = User.find(params[:id])

  end


  private 

  	def user_params 
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
  	end

end