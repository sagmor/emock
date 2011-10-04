require 'action_mailer'

ActionMailer::Base.smtp_settings = {
  :address => "localhost",
  :port => 2525
}

class TestMailer < ActionMailer::Base
  def test
    mail({
      :to => "recipient@example.com",
      :from => "sender@example.com",
      :subject => "Testing mail server"
    }) do |format|
      format.text { render :text => "Email Body" }
    end
  end
end

TestMailer.test.deliver!
