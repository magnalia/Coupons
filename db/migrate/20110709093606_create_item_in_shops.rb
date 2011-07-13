class CreateItemInShops < ActiveRecord::Migration
  def self.up
    create_table :item_in_shops do |t|
      t.integer :shop_id
      t.integer :item_id

      t.timestamps
    end
  end

  def self.down
    drop_table :item_in_shops
  end
end
