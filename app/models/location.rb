class Location < ActiveRecord::Base
  has_many :shops
  belongs_to :city
end
