class TestMailer < ActionMailer::Base
  default template_path: 'mailers/test_mailer'

  def welcome(user)
    mail(to: user.email, subject: 'test').deliver
  end

end