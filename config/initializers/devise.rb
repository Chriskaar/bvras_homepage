Devise.setup do |config|

  config.mailer_sender = 'noreply@chrissite.com'

  require 'devise/orm/active_record'
  
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  config.omniauth :facebook, "941786045918043", "ce79a5837bf40d24437cef68f87d0764"
  config.omniauth :dropbox, "yb2hakxfqcf3grf", "wece4wwhccgajpr"
end
