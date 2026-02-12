class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = :admin

    if @user.save
      session[:user_id] = @user.id
      redirect_to basics_setup_path, notice: "Welcome! Let's set up your barangay site."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
