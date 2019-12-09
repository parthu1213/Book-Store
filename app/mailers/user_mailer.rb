class UserMailer < ApplicationMailer
  default from: "info@book_store.com"
  def welcome_email(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome to Softices Books!!!")
  end

end
