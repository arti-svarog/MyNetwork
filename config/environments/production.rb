Rails.application.configure do

  # Code is not reloaded between requests.
  config.cache_classes = true
  
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  # config.active_job.queue_name_prefix = "mynetwork_#{Rails.env}"
  config.action_controller.perform_caching = true
  
  config.serve_static_assets = true
  config.assets.compile = true
  
  # `config/secrets.yml.key`.
  config.read_encrypted_secrets = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = Uglifier.new(harmony: true)
  # config.assets.css_compressor = :sass
  
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]
  
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  # config.active_record.dump_schema_after_migration = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"
  config.action_mailer.default_url_options = { :host => 'http://mera.network' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = { 
    address: 'smtp.gmail.com',
    port: 587, 
    domain: 'gmail.com', 
    user_name: 'arti.svarogt@gmail.com',
    password: 'arti.svarogt@123',
    authentication: 'plain', 
    enable_starttls_auto: true 
  }
  config.action_mailer.asset_host = 'http://mera.network'

end
