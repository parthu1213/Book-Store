class Book < ApplicationRecord
   belongs_to :user , optional: true
   belongs_to :category , optional: true
   has_many :reviews
   has_many :orders
   has_one_attached :img
end
