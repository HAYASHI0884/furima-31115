class BuyersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
  end

  def new
    @buyer_address = BuyerAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(buyer_params)
     if @buyer_address.valid?
       pay_item
       @buyer_address.save
       redirect_to items_path
     else
       render action: :index
     end
  end

  private

  def buyer_params
   params.permit(:postal_code, :prefectures_id, :municipality, :address_number, :building_name, :phone_number, :item_id, :buyer_id).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_ffb5600e88b15723bec2e94f"
      Payjp::Charge.create(
        amount: @item.price,
        card: buyer_params[:token],
        currency: 'jpy'
      )
  end
end
