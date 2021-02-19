class OrdersController < ApplicationController
before_action :authenticate_user!
before_action :set_item, only:[:index, :create]
before_action :conditional_blanch, only:[:index, :create]

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
       pay_item
       @user_order.save
      redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def conditional_blanch
    if @item.order.present? || current_user == @item.user
      redirect_to root_path
    end
  end

end
