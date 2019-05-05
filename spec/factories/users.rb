# frozen_string_literal: true
::FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Usuáruio #{n}" }
    sequence(:email) { |n| "account_#{n}@mail.com" }
  end
end
