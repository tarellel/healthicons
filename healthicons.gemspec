# frozen_string_literal: true

require_relative 'lib/healthicons/version'

Gem::Specification.new do |spec|
  spec.name          = 'healthicons'
  spec.version       = Healthicons::VERSION
  spec.authors       = ['Brandon Hicks'].freeze
  spec.email         = ['tarellel@gmail.com'].freeze

  spec.summary       = 'An application helper to add healthicon SVG icons to your applications views.'
  spec.description   = 'A helper to easy add healthicon SVG icons to you application'
  spec.homepage      = 'https://github.com/tarellel/healthicons'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.4.0'


  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir['lib/**/*', 'CHANGELOG.md', 'LICENSE.txt', 'README.md']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '>= 1.16'
  spec.add_development_dependency 'rspec', '>= 3.0'
  spec.add_development_dependency 'rubocop', '>= 1.7'
  spec.add_dependency 'rails', '>= 4'
  spec.add_dependency 'nokogiri', '>= 1.6'      # Required for parsing and modifying the SVG icons
end
