class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :day
  belongs_to :user
  has_one_attached :image
  has_one_attached :order

  validates :price, numericality: {with: /\A[0-9]+\z/, message: 'Half-width number'}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}

  with_options presence: true do
    validates :item_name
    validates :explain
    validates :image
    validates :price

    with_options numericality: {other_than: 1 , message: 'Select'} do
      validates :category_id
      validates :condition_id
      validates :fee_id
      validates :prefecture_id
      validates :day_id
    end
  end
end