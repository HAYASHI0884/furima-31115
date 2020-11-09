class BuyersController < ApplicationController
  def index
    @buyer_address = BuyerAddress.new
  end

  def new

  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
     if @buyer_address.valid?
       #pay_item
       @buyer_address.save
       redirect_to items_path
     else
       render action: :index
     end
  end

  private

  def buyer_params
   params.require(:buyer_address).permit(:postal_code, :prefectures_id, :municipality, :address_number, :building_name, :phone_number, :item_id, :buyer_id, :number, :exp_month, :exp_year, :cvc).merge(user_id: current_user.id, authenticity_token: params[:authenticity_token])
  end

  #def pay_item
    #Payjp.api_key = "sk_test_ffb5600e88b15723bec2e94f"
      #Payjp::Charge.create(
        #amount: order_params[:price]
        #card: order_params[:token],
        #currency: 'jpy'
      #)
  #end
end
