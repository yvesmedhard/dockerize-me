class MailmeController < ActionController::Base
  def index
    MailmeMailer.mailcatcher_health_mail.deliver_now
    redirect_to 'localhost:1080'
  end
end
