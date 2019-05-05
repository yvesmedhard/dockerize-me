# frozen_string_literal: true

module BrowserHelpers
  def in_browser(name)
    old_session = Capybara.session_name
    Capybara.session_name = name
    yield
    Capybara.session_name = old_session
  end
end

RSpec.configure do |config|
  config.include BrowserHelpers if config.filter_manager.inclusions.rules[:e2e]
end
