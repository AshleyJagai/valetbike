class Rental < ApplicationRecord
  belongs_to :bike
  belongs_to :user



  def length_of_ride 
    end_time - created_at
  end 


  before_update :pay

  def cost 
    length_of_ride.to_int * 0.5
  end 

  def pay
      ## if enough credits to pay:
      user.update_attribute(:credit, user.credit - cost)
      # else 
        #option to add more credits 
      #end 
      

  end

  


end
