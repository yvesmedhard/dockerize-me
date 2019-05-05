# frozen_string_literal: true

require 'webmock/rspec'

RSpec.configure do |config|
  config.around(:each, js: true, type: :feature) do |example|
    WebMock.allow_net_connect!
    example.call
  end
end
