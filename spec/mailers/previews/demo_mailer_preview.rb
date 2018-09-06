# Preview all emails at http://localhost:3000/rails/mailers/demo_mailer
class DemoMailerPreview < ActionMailer::Preview
  def demo_mail_preview
    DemoMailer.demo_email(User.first)
  end
end
