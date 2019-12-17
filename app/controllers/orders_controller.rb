class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order  = Order.new
  end

  def edit
    @books = Book.all.map { |b|  [b.name, b.id] }
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path
    else
      render 'new'
    end
  end

  def update
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :mobilenumber, :book_id, :user_id)
  end
end
