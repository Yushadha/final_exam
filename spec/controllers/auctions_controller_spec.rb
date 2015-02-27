require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do
let(:auction)   {create(:auction)}
let(:auction_1) {create(:auction)}

	describe "#new" do
		it "assigns a new auction to a variable" do
      get :new
      expect(assigns(:auction)).to be_a_new Auction
    end
  end

  describe "#create" do
  	context "with valid params" do
      def valid_request 
        post :create,  {auction: {
                           title: "valid auction title",
                           detail: "valid details",
                           ends_on: Time.now,
                           reserve_price: 1000,
                       }}
      end

  		it "saves an auction record to the db" do
        expect { valid_request }.to change{ Auction.count }.by(1)
      end
    end

    context "with invalid params" do
      def invalid_request
        post :create, {auction: {detail: "abc"}}
      end

      it "doesnt save to the db" do
        expect {invalid_request}.not_to change {Auction.count} 
      end
    end

    describe "#show" do
      before {get :show, id: auction.id}
      it "assigns an instance variable for auction with passed id" do
      expect(assigns(:auction)).to eq(auction)
      end
    end
  end
end
