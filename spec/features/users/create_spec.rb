# frozen_string_literal: true

require 'rails_helper'

describe 'Create User Flow', type: :feature, js: true, integration: true do
  specify 'I as a visitor can create an User successfully' do
    in_browser(:visitor_window) do

      user_index_page = Users::IndexPage.new(page)
      user_index_page.load_page

      expect(user_index_page).to have_loaded_page
      expect(user_index_page).to have_content('No Users')

      user_index_page.click_on_create_user_button
      user_new_page = Users::NewPage.new(page)

      expect(user_new_page).to have_loaded_page

      user_new_page.fill_name('Yves-Medhard Tibe da Cunha Tibe-Bi')
      user_new_page.fill_email('yves.medhard@codus.com.br')
      user_new_page.click_on_save_user_button
      user_index_page = Users::IndexPage.new(page)

      expect(user_index_page).to have_loaded_page
      expect(user_index_page).to have_content('Yves-Medhard')
    end
  end
end
