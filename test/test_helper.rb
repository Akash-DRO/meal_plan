ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

# Consider setting MT_NO_EXPECTATIONS to not add expectations to Object.
# ENV["MT_NO_EXPECTATIONS"] = true

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods
end
