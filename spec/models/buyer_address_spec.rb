require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer_address)
  end

  describe "商品購入機能" do
    context "購入できるとき" do
      it "すべての欄が埋まっていると保存できる" do
        expect(@buyer).to be_valid
      end
      it "郵便番号が3桁(-)4桁の場合登録できる" do
        @buyer.postal_code = "123-4567"
        expect(@buyer).to be_valid
      end
      it "電話番号が11桁の場合登録できる" do
        @buyer.phone_number = "09012345678"
        expect(@buyer).to be_valid
      end
    end

    context "購入できないとき" do
       it "tokenが空だと登録できない" do
        @buyer.token = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空だと登録できない" do
        @buyer.postal_code = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it "prefectureが未選択だと登録できない" do
        @buyer.prefectures_id = "1"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it "municipalityが空だと登録できない" do
        @buyer.municipality = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Municipality can't be blank")
      end
      it "address_numberが空だと登録できない" do
        @buyer.address_number = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Address number can't be blank")
      end
      it "phone_numberが空だと登録できない" do
        @buyer.phone_number = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it "postal_codeにハイフン(-)がないと登録できない" do
        @buyer.postal_code = "1234567"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Postal code is invalid")
      end
      it "phone_numberにハイフン(-)があると登録できない" do
        @buyer.phone_number = "090-1234-5678"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
