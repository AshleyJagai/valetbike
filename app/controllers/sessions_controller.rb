class SessionsController < ApplicationController
   before_action :authorized, only: [:destroy, :login, :page_requires_login, :show]

   def new
   end

   def create
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id

         redirect_to '/welcome'
      else
         flash[:danger] = "Incorrect username or password"
         redirect_to '/login'
      end
   end

   def destroy
      session.clear()
      redirect_to '/index'
   end

   def login
   end

   def welcome
   end

   def page_requires_login
   end
   
   def show
   end
   def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        render ('edit')
      end
    end
    
    def edit
      @user = User.find(params[:id])
    end
end
