# frozen_string_literal: true

# All mailers inherit from this class
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
