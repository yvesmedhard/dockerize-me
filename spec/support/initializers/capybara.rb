# frozen_string_literal: true

require 'capybara/rails'

if ENV.fetch('USE_HEADLESS_CHROME', nil)
  puts 'Starting Capybara on headless mode'
  Capybara.register_driver :headless_chrome do |app|
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { args: %w[headless disable-gpu] }
    )
    Capybara::Selenium::Driver.new(
      app,
      url: ENV.fetch('SELENIUM_URL', nil),
      browser: :chrome,
      desired_capabilities: capabilities
    )
  end
  Capybara.javascript_driver = :headless_chrome
else
  puts 'Starting capybara in non-headless mode'
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, url: ENV.fetch('SELENIUM_URL', nil), browser: :chrome)
  end
end

RSpec.configure do |config|
  config.before(:all, js: true) do
    Capybara.app_host = ENV.fetch('CAPYBARA_APP_HOST', nil)
  end

  config.before(:each, js: true) { page.current_window.resize_to(1300, 900) }

  config.after(:each, js: true) do
    browser_logs_entries = page.driver.browser.manage.logs.get(:browser)

    if browser_logs_entries.any?
      STDERR.puts 'Chrome Browser logs these messages:'
      STDERR.puts browser_logs_entries
    end
  end
end
