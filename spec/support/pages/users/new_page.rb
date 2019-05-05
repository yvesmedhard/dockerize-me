# frozen_string_literal: true

require_relative '../base_page'

module Users
  class NewPage < ::BasePage

    def load_page
      visit new_user_path
    end

    def fill_name(content)
      fill_in 'cpy-name-input', with: content
    end

    def fill_email(content)
      fill_in 'cpy-email-input', with: content
    end

    def click_on_save_user_button
      find('.cpy-save-button').click
    end

    def click_on_back_button
      find('.cpy-back-button').click
    end

    def has_loaded_page?
      has_selector?('.users-new-page')
    end
  end
end
