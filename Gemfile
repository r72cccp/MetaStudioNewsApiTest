# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'active_model_serializers', '~> 0.10.10'
gem 'bcrypt', '~> 3.1'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bullet', '~> 6.1'
gem 'dotenv-rails', '~> 2.7'
gem 'jwt', '~> 2.2'
gem 'pg', '~> 1.2'
gem 'puma', '~> 4.3'
gem 'rack-attack', '6.2.2'
gem 'rack-cors', '1.1.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'simple_command', '~> 0.1.0'
gem 'tzinfo-data'

group :development, :test do
  gem 'awesome_print', '~> 1.8'
  gem 'byebug', '11.1.1'
  gem 'faker', '~> 2.11'
  gem 'pry', '~> 0.13.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', '2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop-rspec', '1.38.1'
  gem 'rubocop-rails', '~> 2.5'
end

group :test do
  gem 'codecov', '0.1.16', require: false
  gem 'database_cleaner', '1.8.3'
  gem 'factory_bot_rails', '5.1.1'
  gem 'rspec-rails', '4.0.0'
  gem 'shoulda-matchers', '4.3.0'
  gem 'simplecov', '0.18.5', require: false
  gem 'spring-commands-rspec'
end
