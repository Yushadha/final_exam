class Auction < ActiveRecord::Base
	has_many :bids
	validates :title, :detail, :ends_on, :reserve_price , presence: true
end
