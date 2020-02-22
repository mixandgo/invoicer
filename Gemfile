source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 6.0.2", ">= 6.0.2.1"
# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"
# Use Puma as the app server
gem "puma", "~> 4.1"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"
# Use Active Model has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use Active Storage variant
# gem "image_processing", "~> 1.2"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 3.7"
  gem "pry-rails"
  gem "pry-doc"
  gem "pry-byebug"
  gem "factory_bot_rails", "~> 4.0"
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rubocop", require: false
  gem "rubocop-performance"
  gem "rubocop-rspec"
  gem "rubocop-rails"
  gem "bullet"
  gem "brakeman"
  gem "reek"
  gem "rails_best_practices"
  gem "solargraph"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :test do
  gem "cucumber-rails", require: false
  gem "database_cleaner"
  gem "capybara-screenshot"
  gem "simplecov", require: false
  gem "shoulda-matchers", "~> 3.1"
  gem "selenium-webdriver"
  gem "email_spec"
  gem "launchy"
end
