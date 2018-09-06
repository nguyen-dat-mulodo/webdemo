class DemoMailer < ApplicationMailer
  default from: "nguyenducdat2511@gmail.com"

  def demo_email user
    @user = user
    mail to: @user.email, subject: "Demo Email"
  end
end
