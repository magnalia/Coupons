class Item < ActiveRecord::Base
  belongs_to :item_in_shop
  has_many :manufacturers
  has_many :offers
end
