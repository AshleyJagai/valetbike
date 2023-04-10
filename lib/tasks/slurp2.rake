namespace :slurp2 do
  desc "TODO"
  task bikes: :environment do
    require 'csv'    

    csv_text = File.read('/mnt/c/Users/ariar/VALLEYSCOOT/valetbike/notes/bike-data.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      bike = Bike.new        
      bike[:current_station_id] = row["current_station_id"]   
      bike[:identifier] = row["identifier"]
      bike[:status] = 0 
      bike[:battery_charge] = 100 
      bike.save!
      puts "#{bike.identifier}, saved!"
      
    end

  end

end
