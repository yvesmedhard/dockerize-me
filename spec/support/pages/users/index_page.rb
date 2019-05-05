# frozen_string_literal: true

require_relative '../base_page'

module Users
  class IndexPage < ::BasePage

    def load_page
      visit users_path
    end

    def click_on_create_user_button
      find('.cpy-create-user').click
    end

    def has_loaded_page?
      has_selector?('.users-index-page')
    end
  end
end
