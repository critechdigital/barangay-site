ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    fixtures :all
    parallelize(workers: 1)
  end
end

module ActionDispatch
  class IntegrationTest
    def sign_in(user, password: "password123")
      post login_path, params: { email: user.email, password: password }
    end
  end
end
