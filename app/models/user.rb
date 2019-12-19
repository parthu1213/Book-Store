class User < ApplicationRecord
  # after_create :send_admin_mail
  has_many :books, dependent: :nullify 
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :registerable, :confirmable


  # protected
  #   def confirmation_required?
  #     false
  #   end

 #  def send_admin_mail
 #   UserMailer.send_new_user_message(self).deliver
 # end

 def purchased_books
   b = Order.where(user_id: self.id)
   c = b.present? ? b.count : 0
   return c
 end

end
