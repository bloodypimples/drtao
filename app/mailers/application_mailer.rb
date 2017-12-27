class ApplicationMailer < ActionMailer::Base
  default from: STAFF_EMAIL
  layout 'mailer'
end
