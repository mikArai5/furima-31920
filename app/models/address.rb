class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one    :prefecture
  has_one    :order
end
