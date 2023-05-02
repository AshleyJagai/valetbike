class UsersController < ApplicationController

  before_action :authorized, only: [:profile, :show, :update, :edit]
  
  def new
    @user = User.new
    puts @user 
  end

  def create
    @user = User.new(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      flash[:danger] = "Invalid info"
      redirect_to '/users/new'
   end
  end

  def profile
  end
  def show
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to '/users/profile'
    else
      render ('edit')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :email, :address, :date_birth, :phone_number, :credit)
  end
end



