class OrdersController < ApplicationController
before_action :authenticate_user!

  def index
    @order = Order.new(order_params)
    @user_order = UserOrder.new
    @item = Item.find(params[:item_id])
    if @item.order.present? || current_user == @item.user
      redirect_to root_path
    else
      render 'index'
    end
  end

  def new
    @user_order = UserOrder.new(order_params)
  end

  def create
    @item = Item.find(params[:item_id])
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

  
end
