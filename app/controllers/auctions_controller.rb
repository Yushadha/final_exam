class AuctionsController < ApplicationController

	def index
		@auction = Auction.all
	end

	def new
		@auction = Auction.new
	end

	def create
		@auction = Auction.new auction_params
		@auction.save
		if @auction.save
      redirect_to @auction
    else
      render :new
    end
	end

	def show
		find_auction
		@bid_new = Bid.new
		@bids = @auction.bids
		
		@current_price = @auction.try(:bids).maximum(:bid)
		@current_price = @current_price + 1 if @current_price
		if @current_price && @current_price >= @auction.reserve_price
			@reserve_met = "reserve has been met"
		else
			@reserve_met = "reserve has not been met"
		end
	end

	def destroy
		find_auction
		@auction.destroy
		redirect_to '/auctions'
	end

	def edit
		find_auction
	end

	def update
		find_auction
  	if @auction.update_attributes(auction_params)
  		redirect_to '/auctions'
  	else
  		render :edit
  	end
  end

	private
	
	def auction_params
		params.require(:auction).permit(:title, :detail, :ends_on, :reserve_price, :user)
	end

	def find_auction
		@auction = Auction.find params[:id]
	end

end
