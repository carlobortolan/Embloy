class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def findCoordinates
    if !user_params[:country_code].nil? && !user_params[:postal_code].nil? && !user_params[:city].nil? && !user_params[:address].nil?
      @user[:longitude] = 0.0
      @user[:latitude] = 0.0
    end
  end

  def create
    @user = User.new(user_params)
    findCoordinates

    if @user.save
      WelcomeMailer.with(user: @user).welcome_email.deliver_later
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :longitude, :latitude, :country_code, :city, :postal_code, :address, :date_of_birth, :password_repeat)
  end
end
