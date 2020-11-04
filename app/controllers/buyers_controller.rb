class BuyersController < ApplicationController
  def index
    @buyer_address = BuyerAddress.new
  end
end
