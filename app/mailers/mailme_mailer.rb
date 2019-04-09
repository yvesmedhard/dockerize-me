class MailmeMailer < ApplicationMailer
  def mailcatcher_health_mail
    mail(to: 'workshop@docker.com', subject: 'Funcionou')
  end
end
