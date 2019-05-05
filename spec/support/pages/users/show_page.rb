# frozen_string_literal: true

require_relative '../base_page'

module Users
  class ShowPage < ::BasePage

    def load_page(user)
      visit user_path(user)
    end

    def click_on_back_button
      find('.cpy-back-button').click
    end

    def has_loaded_page?
      has_selector?('.users-show-page')
    end
  end
end
