class Notifier < ActionMailer::Base
# existing lines here...
  def error_occured(error)
    @error = error
    mail :to => ENV['TEST_EMAIL'], :subject => 'TOLY App Error Incident'  ## replace your email id to receive mails
  end
end