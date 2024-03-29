source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# https://github.com/bkeepers/dotenv
gem 'dotenv-rails', '2.7.4'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
# https://github.com/slim-template/slim
gem 'slim', '4.0.1'
# https://github.com/slim-template/slim-rails
gem 'slim-rails', '3.2.0'
# https://github.com/plataformatec/devise
gem 'devise', '4.6.2'
# https://github.com/hisea/devise-bootstrap-views
gem 'devise-bootstrap-views', '1.1.0'
# https://github.com/ankane/chartkick
gem 'chartkick', '3.2.0'
# https://github.com/roidrage/lograge
gem 'lograge', '0.11.2'

group :development, :test do
  # https://github.com/rspec/rspec-rails
  gem 'rspec-rails', '3.8.2'
  # https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails', '5.0.2'
  # https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers', '4.1.0'
  gem 'rails-controller-testing', '1.0.4'
  # https://github.com/rweng/pry-rails
  gem 'pry-rails', '0.3.9'
  # https://github.com/rubocop-hq/rubocop
  gem 'rubocop', '0.72.0', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Code coverage for Ruby 1.9+ with a powerful configuration library and automatic merging of coverage across test suites. Read more: https://github.com/colszowka/simplecov
  gem 'simplecov', '0.17.0', require: false
  # https://github.com/BetterErrors/better_errors
  gem 'better_errors', '2.5.1'
  gem 'binding_of_caller', '0.8.0'
  # https://github.com/flyerhzm/bullet
  gem 'bullet', '6.0.1'
end

group :test do
  gem 'rspec_junit_formatter', '0.4.1'
end
