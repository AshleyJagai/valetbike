namespace :slurp2 do
  desc "TODO"
  task bikes: :environment do
    require 'csv'    

    csv_text = File.read('/Users/priyadalal-whelan/Desktop/ashleyvaletbike/valetbike/notes/bike-data.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      bike = Bike.new 
      bike[:identifier] = row["identifier"]       
      bike[:current_station_identifier] = row["current_station_identifier"] 
      if (bike.current_station_identifier.nil? || bike.current_station_identifier == 0)
        bike[:status] = 1
      else
        bike[:status] = 0 
      end 
      bike[:battery_charge] = 100 
      bike.save!
      puts "#{bike.current_station_identifier} saved!"
      
    end

  end

end
