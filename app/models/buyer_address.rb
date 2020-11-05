class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code
    validates :prefectures_id
    validates :municipality
    validates :address_number
    validates :phone_number
  end

  def save
    Buyer.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures.id, municipality: municipality, address_number: address_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end
