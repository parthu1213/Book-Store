class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order  = Order.new
  end

  def edit
    @orders = Order.all.map { |o|  [o.name, o.id] }
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.save
      redirect_to orders_path
    else
      redirect_to root_path, notice: @order.errors.full_messages.join(", ")
    end
  end

  def update
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :mobilenumber, :book_id, :user_id)
  end
end
