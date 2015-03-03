class Bid < ActiveRecord::Base
	belongs_to :auction
	validate :is_new_maximum?, on: :create

	scope :highest, ->(auction_id) { where(auction_id: auction_id).maximum(:bid) }
	
	def is_new_maximum?
		max_bid = Bid.highest(self.auction_id)

		if self.bid < max_bid + 1
			errors.add(:bid, "is not the new highest for this auction")
		end
	end

end