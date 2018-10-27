# frozen_string_literal: true

Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.omniauth :linkedin,
                  Rails.application.credentials.linkedin[:client_id],
                  Rails.application.credentials.linkedin[:client_secret],
                  scope: 'r_basicprofile r_emailaddress'

  config.omniauth :crafted_oauth,
                  Rails.application.credentials.crafted[:client_id],
                  Rails.application.credentials.crafted[:client_secret],
                  scope: 'read write email profile'

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

end
