class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.integer :shop_id
      t.integer :item_id
      t.integer :manufacturer_id
      t.string :discount_data
      t.datetime :start_time
      t.datetime :end_time
      t.integer :only_for

      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
