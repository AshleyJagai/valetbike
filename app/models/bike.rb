class Bike < ApplicationRecord
  validates_presence_of    :identifier
  validates_uniqueness_of  :identifier

  has_many :rentals
  has_many :users, through: :rentals 
  belongs_to :station, optional: true

  #belongs_to :current_station, class_name: :Station, foreign_key: :current_station_id, optional: true
 
end
