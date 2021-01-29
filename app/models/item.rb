class Item < ApplicationRecord
  has_many :comments
  belongs_to :user
  belongs_to :order
  has_one_attached :image

  validates :item_name,     presence: true
  validates :explain,       presence: true
  validates :category_id,   presence: true
  validates :condition_id,  presence: true
  validates :fee_id,        presence: true
  validates :prefecture_id, presence: true
  validates :day_id,        presence: true
  validates :price,         presence: true

end