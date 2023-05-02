class RentalsController < ApplicationController
    def new
        @rental = Rental.new
        #@current_time = Time.now 
    end


    def show 
        @rental = Rental.find(params[:id])
        @rental.start_time = @rental.created_at
    end 


    # @form = UserInvitationForm.new(user_invitation_form_params)
    # if @form.submit
    #   redirect_to root_path, notice: 'Thank you for your enquiry'
    # else
    #   render :new
    # end
    

    def create
        puts "rental is #{@rental}"
        @rental = Rental.new(params.require(:rental).permit(:user_id, :bike_id, :start_station_id, :end_station_id, :end_time, :price, :start_time, :end_time ))
        @rental.save
        if @rental.save 
            @current_bike = Bike.where(id: @rental.bike_id )
            @current_bike.update(current_station_identifier: 0, status: 1) 
            @rental.save
            puts "saved"

            #puts params[:bike_id]
            #bikes = Bike.where(current_station_identifier: @station.identifier )
           #
            # puts "bike is "
            # puts  @current_bike 
            # @current_bike.update(current_station_identifier: 00)
            # puts "changed station"

            #remove bike from station 
            #change bike status to one 
            redirect_to rental_path(@rental) # this should actually go to the active ride page, just wanted somwhere random to send it for now 
        else
            render('new') 
            puts "save failed"
        end
    
    def update
        @rental = Rental.find(params[:id])
        puts "HELLLO"
        if @rental.update(params.require(:rental).permit(:user_id, :bike_id, :start_station_id, :end_station_id, :end_time, :price, :start_time, :end_time ))
            @current_bike = Bike.where(id: @rental.bike_id ) #update bike location
            @current_bike.update(current_station_identifier: @rental.end_station_id, status: 0) 
            #charge user credits. this needs to eventually look at the  amount of time the bike was out, mutliply it by something
            # and then subtract that number from the users credits. should this be a user action?


            # @user = current_user
            # puts "CURRENT USER:"
             
            # puts @user.class 
            # puts @user.username
            #puts @current_user.username 
            # @user = current_user
            # puts @user
            # puts @user.credit 
            # @user.update(credit: 1.000000000) 
            # puts @user.credit
            puts @rental.user.credit
            @rental.user.update(credit: 10.0) 
            puts @rental.user.credit
            @rental.end_time=Time.now()

            #@user.update(credit: 19)
        flash[:success] = "Your scooter is successfully returned!"
        redirect_to '/main/thankyou',allow_other_host: true
        else
            puts 'update failed'
            render ('edit')
        end
    end
    
    def edit
        @rental = Rental.find(params[:id])
    end


       #@rental = Rental.create(params.require(:user_id).permit(:user_id, :bike_id, :start_time, :start_station_id,))
        #redirect_to '/welcome'
    #redirect_to '/welcome'
        #instantate using
        #current user
        #bike we just redierected from 
         

    end

end 
