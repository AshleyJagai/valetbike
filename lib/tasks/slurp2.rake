namespace :slurp2 do
  desc "TODO"
  task bikes: :environment do
    require 'csv'    

    csv_text = File.read('/Users/mac/Ashley/valetbike/notes/bike-data.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      bike = Bike.new 
      bike[:identifier] = row["identifier"]       
      bike[:current_station_identifier] = row["current_station_identifier"] 
      # if (bike.current_station_identifier.nil? || bike.current_station_identifier == 0)
      #   bike[:in_use] = true
      # else
      bike[:in_use] = false
      bike[:battery_charge] = 100 
      bike.save!
      puts "#{bike.current_station_identifier} saved!"
      
    end

  end

end
