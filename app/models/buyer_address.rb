class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address_number, :building_name, :phone_number, :authenticity_token, :item_id, :user_id, :token

  with_options presence: true do
    validates :municipality
    validates :address_number
    validates :token
  end

  validates :prefectures_id, presence: true, numericality: { other_than: 0 }
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, presence: true, format: { with: /\A\d{11}\z/ }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address_number: address_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end
