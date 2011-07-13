class CouponsController < ApplicationController
  def test
    offers_list = []
    code_array = ("A".."Z").to_a
    @random_code = code_array.shuffle[0..7].join
    @my_offer = nil
    keywords = params['search'].split " "
    item = keywords[0] if keywords.count >= 1
    location = keywords[1] if keywords.count >= 2
    item_list = Item.where("name like ?", item)
    item_list.each do |item|
      item.offers.order("given_for asc").each do |offer|
        offers_list << offer
      end
    end
    offers_list.each do |offer|
      if offer.start_time < Time.now && offer.end_time > Time.now
        if offer.only_for > 0 && offer.given_for < offer.only_for && @my_offer.nil?
          @my_offer = offer
          @item = Offer.find(offer.id).item.name
          @shop = Offer.find(offer.id).shop.name
          shop_id = Offer.find(offer.id).shop.id
          @location = Shop.find(shop_id).location.name
          if offer.manufacturer_id > 0
          @manufacturer = Offer.find(offer.id).manufacturer.name
          else
          @manufacturer = nil
          end
          updater = Offer.find(offer.id)
          updater.given_for += 1
          updater.save
          Code.create(:offer_id => offer.id, :msisdn => params['msisdn'], :code => @random_code)
        else
         if offer.only_for == 0 && @my_offer.nil?
          @my_offer = offer
          @item = Offer.find(offer.id).item.name
          @shop = Offer.find(offer.id).shop.name
          shop_id = Offer.find(offer.id).shop.id
          @location = Shop.find(shop_id).location.name
          if offer.manufacturer_id > 0
          @manufacturer = Offer.find(offer.id).manufacturer.name
          else
          @manufacturer = nil
          end
          updater = Offer.find(offer.id)
          updater.given_for += 1
          updater.save
          Code.create(:offer_id => offer.id, :msisdn => params['msisdn'], :code => @random_code)
         end
        end
      end
    end
  end
end