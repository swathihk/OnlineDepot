class UserMailer < ActionMailer::Base
  default :from => "eabyasinfo@gmail.com"
  def registration_confirmation(user)
    mail(:to => user.email, :subject => "Registered")
  end
  def payment_mail(usermail)
    mail(:to=>usermail.email ,:subject =>"Payment Deatils")
  end
end
