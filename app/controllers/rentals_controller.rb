class RentalsController < ApplicationController
    def new
        @rental = Rental.new
        #@current_time = Time.now 
       
    end

    # @form = UserInvitationForm.new(user_invitation_form_params)
    # if @form.submit
    #   redirect_to root_path, notice: 'Thank you for your enquiry'
    # else
    #   render :new
    # end

    def show 
    
    end 
    

    def create
        puts "rental is #{:rental}"
        @rental = Rental.new(params.require(:rental).permit(:user_id, :bike_id, :start_station_id, :end_station_id, :end_time, :price, :start_time, :end_time ))
        if @rental.save 
            puts "saved"
            redirect_to 'rental_path' # this should actually go to the active ride page, just wanted somwhere random to send it for now 
        else
            render('new') 
            puts "save failed"
        end



       #@rental = Rental.create(params.require(:user_id).permit(:user_id, :bike_id, :start_time, :start_station_id,))
        #redirect_to '/welcome'
    #redirect_to '/welcome'
        #instantate using
        #current user
        #bike we just redierected from 
         

    end



end 
