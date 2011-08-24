require 'ruby-debug'
require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'

Capybara.default_driver = :selenium
Capybara.app_host = ENV['CAPYBARA_TEST_URL'] || 'http://localhost:8080'

World(Capybara)
