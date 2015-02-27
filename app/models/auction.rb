class Auction < ActiveRecord::Base
	validates :title, :detail, :ends_on, :reserve_price , presence: true
end
