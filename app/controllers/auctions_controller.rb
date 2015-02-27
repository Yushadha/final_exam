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
		@auction = Auction.find params[:id]
		render :show
	end

	private
	
	def auction_params
		params.require(:auction).permit(:title, :detail, :ends_on, :reserve_price, :user)
	end

end
