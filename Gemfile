source "https://rubygems.org"

ruby "3.3.0"

# Base rails dependencies
gem "rails", github: "rails/rails", branch: "main"
gem "propshaft"
gem "pg", "~> 1.5"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "redis", ">= 4.0.1"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

# Custom dependencies

# Web 3
gem "eth"

# Requests
gem "faraday"

# Async
gem "sidekiq"
gem "sidekiq-scheduler"
gem "sidekiq-status"

# Might need later
# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"
# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "rubocop-rails-omakase", require: false
  gem "pry-byebug"
  gem "pry-rails"
  gem "dotenv-rails"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
