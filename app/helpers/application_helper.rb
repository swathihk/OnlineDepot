module ApplicationHelper
=begin
def show_flash
    [:notice, :warning, :message].collect do |key|
      content_tag(:div, flash[key], :class => "flash flash_#{key}") unless flash[key].blank?
    end.join
  end
=end

  #def login(user)
  #  post user_login_path, :email => user.email, :password => user.password
  #end
end
