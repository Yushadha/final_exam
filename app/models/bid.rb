class Bid < ActiveRecord::Base
	belongs_to :auction
	# validates_numericality_of :bid, greater_than_or_equal_to: Bid.maximum(self.auction_id)

	# def self.maximum(auction_id)
	# 	array = Bid.where(auction_id: auction_id).pluck(:bid)
	# 	max = array.first

	# 	array.each do |b|
	# 		if b >= max 
	# 			max = b
	# 		end
	# 	end

	# 	return max
	# end
end
