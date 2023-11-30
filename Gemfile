# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in healthicons.gemspec
gemspec

gem 'rake', "~> 13.0"


group :development do
  gem 'fasterer'
  gem 'guard', '~> 2.16'
  gem 'guard-rspec'               # Runs tests against your application if spec files are changed
  gem 'guard-bundler'             # Runs bundle install if anything you Gemfile is changed
  gem 'guard-fasterer'
  gem 'guard-rubocop', '~> 1.3' # Runs rubocop tests against your code as files are changed
  gem 'guard-shell', require: false # Used to regenerate yardoc and regenerate Sorbet type checking with sord
  # gem 'guard-yard'                # Used for generating new yard documentation as changes are made

  gem 'rubocop', '>= 0.89', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rspec'
  gem 'sord'
end

group :test do
  gem 'fuubar'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-tailwindcss', require: false
  gem 'webmock' # github: 'bblimke/webmock'
end