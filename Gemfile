source 'https://rubygems.org'

ruby '3.3.7'

# Core gems
gem 'rails', '~> 7.1.3'
gem 'pg', '~> 1.1'
gem 'puma', '~> 6.0'
gem 'sass-rails', '>= 6'
gem 'jbuilder', '~> 2.7'
gem 'bcrypt', '~> 3.1.7'
gem 'image_processing', '~> 1.2'
gem 'devise'
gem 'active_model_serializers', '~> 0.10.0'
gem 'rack-cors'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'carrierwave'

# Heroku deployment
gem 'rails_12factor', group: :production

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
