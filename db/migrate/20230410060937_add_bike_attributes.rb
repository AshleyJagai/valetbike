class AddBikeAttributes < ActiveRecord::Migration[7.0]
  def change
   
    #cannot be less than 0 
    add_column :bikes, :battery_charge, :integer 
    
    #status is  be an integer that maps to the status of a bike

    #preliminary status: 
     # 0 = docked/available + charged
     # 1 = on a ride 
     # 2 = out of service 
     # 3 = low battery 
     # 4 = missing 
     # 5 = other 

     add_column :bikes, :in_use, :boolean,  default: false
  
     

    #wondering if we should add a column for lastRenter - this would help track who last had the bike 
    # would it make more sense to keep this in the rental class? that would mean 

    #add_column :bikes, :lastuseremail, :integer 
  
  end
end
