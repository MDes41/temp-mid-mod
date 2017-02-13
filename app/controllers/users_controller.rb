class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def index
		
	end

	def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash['alert-success'] = "Welcome, #{@user.email}"
      redirect_to root_path
    else
      flash.now['alert-danger'] = @user.errors.full_messages.join(', ')
      render :new
    end
  end



  private
  	def user_params
  		params.require(:user).permit(:email, :password, :password_confirmation)
  	end
end