require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    describe '配送先入力' do
      it '郵便番号が空では購入できない' do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号にはハイフンがないと購入できない' do
        @user_order.postal_code = 1234567
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Postal code Input correctly"
      end
      it '配送元の都道府県を選択しないと購入できない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Prefecture Select"
      end
      it '市区町村が空では購入できない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空では購入できない' do
        @user_order.house_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "House number can't be blank"
      end
      it '電話番号が空では購入できない' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号はハイフンがついていては購入できない' do
        @user_order.phone_number = '090-1234-5678'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Phone number Input only number"
      end
      it "tokenが空では登録できないこと" do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end