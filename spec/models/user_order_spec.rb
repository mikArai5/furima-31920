require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @user_order = FactoryBot.build(:user_order, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end

    describe '配送先入力' do
      context '商品購入情報登録ができる' do
        it '全ての情報が正しく入力されれば登録できる' do
          expect(@user_order).to be_valid
        end
        it '建物名が空でも登録できる' do
          @user_order.building_name = nil
          @user_order.valid?
        end
      end

      context '商品購入情報登録ができないとき' do
        it '郵便番号が空では登録できない' do
          @user_order.postal_code = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include "Postal code can't be blank"
        end
        it '郵便番号にはハイフンがないと登録できない' do
          @user_order.postal_code = "1234567"
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include "Postal code Input correctly"
        end
        it '配送元の都道府県を選択しないと登録できない' do
          @user_order.prefecture_id = 1
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include "Prefecture Select"
        end
        it '市区町村が空では登録できない' do
          @user_order.city = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include "City can't be blank"
        end
        it '番地が空では登録できない' do
          @user_order.house_number = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include "House number can't be blank"
        end
        it '電話番号が空では登録できない' do
          @user_order.phone_number = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include "Phone number can't be blank"
        end
        it '電話番号はハイフンがついていては登録できない' do
          @user_order.phone_number = '090-1234-5678'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include "Phone number Input only number"
        end
        it '電話番号が12桁以上では登録できない' do
          @user_order.phone_number = '090123456789'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include "Phone number Input correctly"
        end
        it '電話番号が全角数字では登録できない' do
          @user_order.phone_number = '０９０１２３４５６７８'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include "Phone number Input only number"
        end
        it 'tokenが空では登録できないこと' do
          @user_order.token = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Token can't be blank")
        end
        it 'user_idが空では登録できない' do
          @user_order.user_id = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空では登録できない' do
          @user_order.item_id = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
end