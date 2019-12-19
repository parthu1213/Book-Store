class Book < ApplicationRecord
   belongs_to :user, optional: true
   # belongs_to :category
   has_many :reviews, dependent: :destroy
   has_many :orders, dependent: :destroy
   has_one_attached :img
end
