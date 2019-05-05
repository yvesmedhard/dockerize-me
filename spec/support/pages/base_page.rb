# frozen_string_literal: true

class BasePage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def initialize(page = nil)
    @page = page
  end

  def page
    @page || super
  end
end
