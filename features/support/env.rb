require 'ruby-debug'
require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'

Capybara.default_driver = :selenium

=begin
#uncomment to use Chrome
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
=end

Capybara.app_host = ENV['CAPYBARA_TEST_URL'] || 'http://localhost:8080'

World(Capybara)
