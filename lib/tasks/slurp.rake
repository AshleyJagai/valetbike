namespace :slurp do
  desc "TODO"
  task stations: :environment do
    require 'csv'    

      csv_text = File.read("/mnt/c/Users/ariar/VALLEYSCOOT/valetbike/notes/station-data.csv")

  csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
  csv.each do |row|
    puts row.to_hash
  end

  csv.each do |row|
    if(!row["identifier"].nil?)
      s = Station.new
      s.identifier = row["identifier"] #here
      s.name = row["name"] #here
      s.has_kiosk = row["has_kiosk"] # 0 false 1 true
      s.needs_maintenance = row["needs_maintenance"] # 0 false 1 true
      s.dock_count = row["dock_count"] #boolean
      s.docked_bike_count = row["docked_bike_count"] #int
      s.bikes_at_station = "" #empty string, gonna then add bikes later
      s.address = row["address"] #here
      if s.dock_count == s.docked_bike_count
        s.is_full = true #boolean
      elsif s.docked_bike_count > s.dock_count || s.docked_bike_count < 0
        puts "ERROR WITH BIKES TOO MANY AHHHHH"
      else
        s.is_full = false #boolean
      end
      s.save!
      puts "#{s.identifier}, #{s.address} saved"
    else
      break
    end 
  end
  
  puts "There are now #{Station.count} rows in the transactions table"


  end
end
