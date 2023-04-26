class Station < ApplicationRecord
  validates_presence_of    :identifier,
                           :name,
                           :address
  validates_uniqueness_of  :identifier

  #has_many :bikes
  
  has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_identifier

  def to_param
    identifier
  end

  def num_docks_available
    dock_count - docked_bike_count
  end 

  
  
end
