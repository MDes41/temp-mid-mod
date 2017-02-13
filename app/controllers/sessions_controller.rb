class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      flash['alert-success'] = "Welcome, #{@user.email}"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now['alert-danger'] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def login_params
      params.permit(:password, :password_confirmation)
    end
end