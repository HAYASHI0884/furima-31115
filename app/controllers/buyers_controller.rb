class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :sold_out_items
  before_action :set_item, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
  end

  def new
    @buyer_address = BuyerAddress.new
  end

  def create
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    item = Item.find(params[:item_id])
    redirect_to items_path if current_user.id == item.user_id
  end

  def sold_out_items
    item = Item.find(params[:item_id])
    redirect_to items_path if Buyer.exists?(item_id: item)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
