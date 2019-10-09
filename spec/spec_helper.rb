ENV["RACK_ENV"] = "test"

require_relative '../config/environment'
require 'rspec'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'chromedriver-helper'
require 'rack_session_access/capybara'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate SINATRA_ENV=test` to resolve the issue.'
end

ActiveRecord::Base.logger = nil

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include Rack::Test::Methods
  config.include Capybara::DSL
  DatabaseCleaner.strategy = :truncation

  config.before do
    DatabaseCleaner.clean
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.order = 'default'
end

Capybara.configure do |config|
  config.default_max_wait_time = 10
end

Capybara.app = Rack::Builder.parse_file(
  File.expand_path('../config.ru', __dir__)
).first

Capybara.server = :webrick

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium_chrome
