# Be sure to restart your server when you modify this file.

#Rails.application.config.session_store :cookie_store, key: '_workspace_session'
#Rails.application.config.session_store :active_record_store, key: '_w_session'
Rails.application.config.session_store :active_record_store, :key =>  '_w_session'
#Rails.application.config.session_store :redis_store, servers: ENV['REDIS_URL']