class User < ApplicationRecord
  # after_create :send_admin_mail
  has_many :books
  has_many :reviews
  has_many :orders

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

end
