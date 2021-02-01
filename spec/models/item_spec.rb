require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿' do
    context '商品投稿ができるとき' do
      it '全ての項目が正しく入力されているとき' do
        expect(@item).to be_valid
      end
    end

    context '商品投稿できないとき' do
      it '画像がないと投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品説明がないと投稿できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explain can't be blank"
      end
      it '商品名が空では投稿できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'カテゴリーを選択しないと投稿できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category Select"
      end
      it '商品の状態を選択しないと投稿できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition Select"
      end
      it '配送料金についての項目を選択しないと投稿できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee Select"
      end
      it '配送元の都道府県を選択しないと投稿できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture Select"
      end
      it '配送までの日数を選択しないと投稿できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Day Select"
      end
      it '価格が空では投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が¥300~¥9,999,999の間でないと投稿できない' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
      it '価格が半角数字でないと投稿できない' do
        @item.price = 'price'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Half-width number"
      end
    end
  end
end