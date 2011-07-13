class Manufacturer < ActiveRecord::Base
  belongs_to :item
  has_many :offers
end
