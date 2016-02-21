source 'https://rubygems.org'
gem 'rails', '3.2.22'

# Database
gem 'mysql2', '~> 0.3.10'

# Rails requirements
gem 'jquery-rails'

# Front-end Framework
gem 'foundation-rails'
gem 'foundation_rails_helper'

# Add ons
gem 'devise' # User authentication
gem 'paperclip' # Add images to DB
gem 'braintree' # Handle payments
gem 'figaro', "~> 0.7.0" # Handle secrets/credentials

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'foundation-icons-sass-rails'
end

group :development do
  gem 'quiet_assets'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'rspec-activemodel-mocks'
  gem 'shoulda-matchers'
  gem 'pry-rails'
end
