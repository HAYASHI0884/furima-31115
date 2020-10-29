require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,lastname,firstname,lastname_kana,firstname_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上で登録できる" do
        @user.password = "111aaa"
        @user.password_confirmation = "111aaa"
        expect(@user).to be_valid
      end

      it "lastnameに全角文字を使用すると登録できる" do
        @user.lastname = "山田"
        expect(@user).to be_valid
      end

      it "firstnameに全角文字を使用すると登録できる" do
        @user.firstname = "太郎"
        expect(@user).to be_valid
      end

      it "lastname_kanaに全角カナを使用すると登録できる" do
        @user.lastname_kana = "ヤマダ"
        expect(@user).to be_valid
      end

      it "firstname_kanaに全角カナを使用すると登録できる" do
        @user.firstname_kana = "タロウ"
        expect(@user).to be_valid
      end
    end


    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "111aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが英字だけだと登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが数字だけだと登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "lastnameが空だと登録できない" do
        @user.lastname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it "lastnameが半角文字だと登録できない" do
        @user.lastname = "ｱｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname 全角文字を使用してください")
      end
      it "firstnameが空だと登録できない" do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it "firstnameが半角文字だと登録できない" do
        @user.firstname = "ｱｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname 全角文字を使用してください")
      end
      it "lastname_kanaが空だと登録できない" do
        @user.lastname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it "lastneme_kanaが全角かなだと登録できない" do
        @user.lastname_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana 全角カナを使用してください")
      end
      it "firstname_kanaが空だと登録できない" do
        @user.firstname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it "firstname_kanaが全角かなだと登録できない" do
        @user.firstname_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana 全角カナを使用してください")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
