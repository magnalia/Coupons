class City < ActiveRecord::Base
  has_many :locations
  belongs_to :country
end
