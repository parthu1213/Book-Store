class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @book = Book.new
  end

  def new
    if params[:book_id].present?
    @order  = Order.new
  end

  def edit
    @books = Book.all.map { |b|  [b.name, b.id] }
  end

  def create
    @order = Order.new(book_params)
    @order.book_id = @book.id
    @order.user_id = current_user.id
      if @order.save
        redirect_to order_path(@order)
      else
        render 'new'
      end
    end
  end

  def update
    if @order.upate(book_params)
      redirect_to order_path(@book)
    else
      render 'edit'
    end
  end
end
