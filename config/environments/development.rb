# frozen_string_literal: true

Rails.application.configure do
  if ENV['BULLET_ENABLED'].to_s == 'true'
    config.after_initialize do
      Bullet.enable        = true
      Bullet.alert         = true
      Bullet.bullet_logger = true
      Bullet.console       = true
      Bullet.rails_logger  = true
      Bullet.add_footer    = true
    end
  end

  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.active_storage.service = :local
  config.active_support.deprecation = :log
  config.cache_classes = false
  config.consider_all_requests_local = true
  config.eager_load = false
  config.file_watcher = ActiveSupport::FileUpdateChecker
  config.action_controller.perform_caching = false
end
