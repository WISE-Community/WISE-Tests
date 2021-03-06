require 'ruby-debug'
require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rubygems'

Capybara.default_driver = :selenium
Capybara.default_wait_time = 10

=begin
#uncomment to use Chrome
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
=end

Capybara.app_host = ENV['CAPYBARA_TEST_URL'] || 'http://localhost:8080'

World(Capybara)
