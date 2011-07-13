class CreateCodes < ActiveRecord::Migration
  def self.up
    create_table :codes do |t|
      t.integer :offer_id
      t.string :msisdn
      t.string :code
      t.integer :claimed_status
      t.datetime :claimed_time

      t.timestamps
    end
  end

  def self.down
    drop_table :codes
  end
end
