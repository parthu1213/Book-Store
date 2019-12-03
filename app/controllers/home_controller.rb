class HomeController < ApplicationController
  def index
       @books = Book.last(5)
  end
end
