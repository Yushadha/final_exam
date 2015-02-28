class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :bid
      t.datetime :bid_date

      t.timestamps null: false
    end
  end
end
