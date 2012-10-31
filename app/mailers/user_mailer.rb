class UserMailer < ActionMailer::Base
  default :from => "eabyasinfo@gmail.com"
  def registration_confirmation(usermail) #user
    mail(:to => useremail, :subject => "Registered")
    #:to=>user.mail
  end
  def payment_mail(usermail)
    mail(:to=>usermail.email ,:subject =>"Payment Deatils")
  end
end
