# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) do |repo| "https://github.com/#{repo}.git" end

ruby "2.7.2"

gem "bootsnap", ">= 1.4.2", require: false
gem "jbuilder", "~> 2.7"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.3", ">= 6.0.3.6"
gem "sass-rails", ">= 6"
gem "sqlite3", "~> 1.4"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "faker", git: "https://github.com/faker-ruby/faker.git", branch: "master"
end

group :development do
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "cucumber-rails", require: false
  gem "rubocop-rails", require: false
  gem "selenium-webdriver"
  gem "webdrivers"
  # database_cleaner is not mandatory, but highly recommended
  gem "database_cleaner"
  gem "rspec-rails", "~> 3.0"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "cocoon"
gem "devise"
gem "jquery-rails"
gem "pry-rails"
gem "pundit"
gem "simple_form"
