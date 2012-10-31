class UserObserver < ActiveRecord::Observer
  #after_save :send_email
  observe :user
  def after_save(user)
    UserMailer.registration_confirmation(user.email).deliver
    puts "------hello--#{user.email}----------"
  end
end
