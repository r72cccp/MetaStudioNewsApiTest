# frozen_string_literal: true

require 'dotenv'
Dotenv.load('config/.env.local')
max_threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }
min_threads_count = ENV.fetch('RAILS_MIN_THREADS') { max_threads_count }
threads min_threads_count, max_threads_count

environment ENV.fetch('RAILS_ENV') { 'development' }
pidfile ENV.fetch('PIDFILE') { "#{Dir.pwd}/tmp/pids/server.pid" }
port ENV.fetch('PORT') { 3000 }

# bind ENV.fetch('SOCKETFILE') { "unix://#{Dir.pwd}/tmp/sockets/puma.sock" }
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }
# preload_app!
plugin :tmp_restart
