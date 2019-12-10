class ReviewsController < ApplicationController
  before_action :find_book, only: [:new, :create]
  before_action :find_review, only: [:edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

   def create
    @review = Review.new(review_params)
    @review.book_id = @book.id
    @review.user_id = current_user.id
    if @review.save
      puts "======BOOK=====#{@book.inspect}=========="
      puts "======review=====#{@review.inspect}=========="
      redirect_to book_path(@book)
    else
      render ' new'
    end
   end
 end



    def update
      if @review.update(review_params)
        redirect_to book_path(@book)
      else
        render 'edit'
      end
    end


    def destroy
      @review.destroy
      redirect_to book_path(@book)
    end


  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_book
    puts"-------l---#param---#{params.inspect}------"
    @book = Book.find(params[:book_id].to_i)
  end

  def find_review
    @review = Review.find(params[:id])
  end
