class Offer < ActiveRecord::Base
  belongs_to :shop
  belongs_to :item
  belongs_to :manufacturer
end
