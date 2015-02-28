class BidsController < ApplicationController
  
  def new
    @bid_new = Bid.new
  end

  def index
  end

  def show
  end

  def create 
    @auction = Auction.find(params[:auction_id])
    @bid_new = Bid.new bid_params
    @bid_new.auction = @auction
    @bid_new.save
    redirect_to auction_path(@auction)
  end

  def destroy
  end

  def update
  end

  private
  
  def bid_params
    params.require(:bid).permit(:bid, :created_at, :auction, :user)
  end

  def find_bid
    @bid = Bid.find params[:id]
  end

end
