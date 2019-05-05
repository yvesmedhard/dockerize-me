# frozen_string_literal: true

Dir[Rails.root.join('spec/support/initializers/**/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
