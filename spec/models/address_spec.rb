require 'rails_helper'

RSpec.describe Address, type: :model do
  before do 
    @address = FactoryBot.build(:address)
  end

  describe '配送先入力' do
    it '郵便番号が空では購入できない' do
      @address.postal_code = nil
      @address.valid?
      expect(@address.errors.full_messages).to include "Postal code can't be blank"
    end
    it '郵便番号にはハイフンがないと購入できない' do
      @address.postal_code = 1234567
      @address.valid?
      expect(@address.errors.full_messages).to include "Postal code Input correctly"
    end
    it '配送元の都道府県を選択しないと購入できない' do
      @address.prefecture_id = 1
      @address.valid?
      expect(@address.errors.full_messages).to include "Prefecture Select"
    end
    it '市区町村が空では購入できない' do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include "City can't be blank"
    end
    it '番地が空では購入できない' do
      @address.house_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include "House number can't be blank"
    end
    it '電話番号が空では購入できない' do
      @address.phone_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include "Phone number can't be blank"
    end
    it '電話番号はハイフンがついていては購入できない' do
      @address.phone_number = '090-1234-5678'
      @address.valid?
      expect(@address.errors.full_messages).to include "Phone number Input only number"
    end
  end
end

