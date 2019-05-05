# frozen_string_literal: true

require 'rails_helper'

describe 'Show User Flow', type: :feature, js: true, integration: true do
  specify 'I as a visitor can see an User details successfully' do
    user = FactoryBot.create(:user, name: 'Nome Show Page', email: 'Email Show Page')
    in_browser(:visitor_window) do
      user_index_page = Users::IndexPage.new(page)
      user_index_page.load_page

      expect(user_index_page).to have_loaded_page
      expect(user_index_page).to have_content('Nome Show Page')

      user_index_page.click_show_button_on_row(0)
      user_show_page = Users::ShowPage.new(page)

      expect(user_show_page).to have_loaded_page

      expect(user_show_page).to have_content('Name')
      expect(user_show_page).to have_content('Email')

      user_show_page.click_on_back_button
      user_index_page = Users::IndexPage.new(page)
      user_index_page.load_page

      expect(user_index_page).to have_loaded_page
    end
  end
end
