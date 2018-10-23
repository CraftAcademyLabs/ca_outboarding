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
    :scope => 'r_basicprofile r_emailaddress'

  require "omniauth_cognitive_class"

  callback_url = "#{Rails.application.credentials.cax(:MY_ORIGIN)}/users/auth/bdu/callback"
  
  config.omniauth :cognitive_class, Rails.application.credentials.cax(:COGNITIVE_ID), Rails.application.credentials.cax(:COGNITIVE_SECRET),
    callback_url:           callback_url,
    provider_ignores_state: true,
    strategy_class:         OmniAuth::Strategies::CognitiveClass

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

end
