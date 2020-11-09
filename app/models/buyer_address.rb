class BuyerAddress
  include ActiveModel::Model
  attr_accessor :nickname, :email, :encrypted_password, :lastname, :firstname, :lastname_kana, :firstname_kana, :birthday, :name, :introduction, :price, :category_id ,:item_condition_id, :postage_payer_id, :shipping_area_id, :preparation_day_id, :postal_code, :prefectures_id, :municipality, :address_number, :building_name, :phone_number, :authenticity_token, :user_id, :number, :exp_month, :exp_year, :cvc

  with_options presence: true do
    validates :address_number
    validates :prefectures_id
    validates :municipality
    validates :user_id
    validates :number
    validates :exp_month
    validates :exp_year
    validates :cvc
    validates :authenticity_token
  end

  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, presence: true, format: { with: /\A\d{11}\z/ }

  def save
    user = User.create(nickname: nickname, email: email, encrypted_password: encrypted_password, lastname:lastname, firstname: firstname, lastname_kana: lastname_kana, firstname_kana: firstname_kana, birthday: birthday)
    item = Item.create(name: name, introduction: introduction, price: price, category_id: category_id ,item_condition_id: item_condition_id, postage_payer_id: postage_payer_id, shipping_area_id: shipping_area_id, preparation_day_id: preparation_day_id, user_id:user.id)
    buyer = Buyer.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address_number: address_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end
