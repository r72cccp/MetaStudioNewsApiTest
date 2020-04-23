# frozen_string_literal: true

class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  Rack::Attack.safelist('allow from localhost') do |req|
    ['127.0.0.1', '::1'].include? req.ip
  end

  Rack::Attack.throttle 'req/ip', limit: 15, period: 1.second, &:ip

  Rack::Attack.blocklisted_response = lambda do |_env|
    [503, {}, ['Blocked']]
  end

  Rack::Attack.throttled_response = lambda do |_env|
    [503, {}, ["Server Error\n"]]
  end
end
