Devise.setup do |config|
  # The e-mail address that mail will appear to be sent from
  # If absent, mail is sent from "please-change-me-at-config-initializers-devise@example.com"
  config.mailer_sender = 'Kamaete Account Support <accounts@kamaete>'

  # Since using rails-api, tell devise to not use ActionDispatch::Flash
  # middleware b/c rails-api does not include it.
  # See: http://stackoverflow.com/q/19600905/806956
  config.navigational_formats = [:json]

  config.allow_unconfirmed_access_for = 3.days
  config.reconfirmable = true
  config.confirm_within = 1.day
end
