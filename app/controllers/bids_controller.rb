class BidsController < ApplicationController
  
  def new
    @bid_new = Bid.new
  end

  def index
  end

  def show
  end

  def create 
    @bid = Bid.all
    @auction = Auction.find(params[:auction_id])
    @bid_new = Bid.new bid_params
    @bid_new.auction = @auction
    if @bid.where(auction_id: @auction.id).count != 0 && @bid_new.bid > @bid.where(auction_id: @auction.id).maximum(:bid)
      @bid_new.save
      else @bid.where(auction_id: @auction.id).last == nil
      @bid_new.save
    end
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
