class UserOrder
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order_id
  
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
    validates :token
    validates :user_id
    validates :item_id
  end

    validates  :prefecture_id, numericality: {other_than: 1 , message: 'Select'}
    validates  :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly'}
    validates  :phone_number, format: {with:/\A\d{10,11}\z/, message: 'Input only number'}
    validates  :phone_number, length:{ maximum: 11, message: 'Input correctly'}

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
    end
  end