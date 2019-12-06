class UserMailer < ApplicationMailer
  default from: "info@book_store.com"
  def send_enabled_message(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to Softices Books!!!")
  end
  def send_new_user_message(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome to Softices Books")
  end
end
