class Shop < ActiveRecord::Base
  belongs_to :location
  has_many :item_in_shops
  has_many :offers
end
