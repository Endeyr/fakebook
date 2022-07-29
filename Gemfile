# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'active_storage_validations'
gem 'active_type'
gem 'bcrypt'
gem 'bootsnap', require: false
gem 'carrierwave', '~> 2.2', '>= 2.2.2'
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
gem 'gravatar_image_tag', '~> 1.2'
gem 'image_processing', '>= 1.2'
gem 'importmap-rails'
gem 'jbuilder'
gem 'jquery-rails', '~> 4.5'
gem 'mini_magick', '~> 4.11'
gem 'oauth2', '~> 2.0', '>= 2.0.6'
gem 'pg', '~> 1.4', '>= 1.4.2'
gem 'pgcli-rails'
gem 'public_activity', '~> 2.0', '>= 2.0.2'
gem 'puma', '~> 5.0'
gem 'rack-canonical-host'
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'
gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'main'
gem 'sassc-rails', '~> 2.1', '>= 2.1.2'
gem 'simple_form', '~> 5.0', '>= 5.0.3'
gem 'simple_form_fancy_uploads'
gem 'socialization', '~> 2.0', '>= 2.0.1'
gem 'sprockets-rails', '~> 3.4', '>= 3.4.2'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'will_paginate', '3.3.1'
gem 'bulma-rails', '~> 0.9.3'
gem 'coffee-rails', '~> 5.0'

group :development, :test do
  gem 'byebug'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'guard', '2.18.0'
  gem 'guard-minitest', '2.4.6'
  gem 'launchy'
end

group :development do
  gem 'amazing_print'
  gem 'annotate'
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  gem 'binding_of_caller'
  gem 'brakeman', require: false
  gem 'letter_opener'
  gem 'rubocop', require: false
  gem 'rubocop-faker', '~> 1.1', require: false
  gem 'rubocop-minitest', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'web-console', '4.2.0'
end

group :test do
  gem 'capybara'
  gem 'minitest', '~> 5.16', '>= 5.16.2'
  gem 'minitest-ci', '~> 3.4'
  gem 'minitest-reporters', '~> 1.5'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'selenium-webdriver'
  gem 'shoulda-context'
  gem 'shoulda-matchers'
  gem 'webdrivers'
end

group :production do
  gem 'aws-sdk-s3', '1.114.0', require: false
  gem 'postmark-rails'
  gem 'sidekiq'
end
