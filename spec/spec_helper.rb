require 'rspec'
require 'capybara'
require 'capybara/dsl'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = 'http://localhost:8080'

module CapybaraStandalone
  def self.setup
    Capybara.configure do |config|
      config.app_host       = ENV['CAPYBARA_TEST_URL'] || 'http://localhost:8080'
      config.run_server     = false
      config.default_driver = :selenium
    end
  end
end

RSpec.configure do |config|
  config.include Capybara::DSL

  config.before(:all) do
    CapybaraStandalone.setup
  end
  config.after do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
