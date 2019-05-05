# frozen_string_literal: true

module PagesHelpers
  def create_new_page
    Capybara::Session.new(Capybara.current_driver, Capybara.app)
  end
end

RSpec.configure do |config|
  config.include PagesHelpers
end
