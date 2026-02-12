require "test_helper"

class AuthTest < ActionDispatch::IntegrationTest
  test "signup creates user and redirects to wizard" do
    assert_difference "User.count", 1 do
      post signup_path, params: { user: {
        name: "New User",
        email: "new@example.com",
        password: "password123",
        password_confirmation: "password123"
      } }
    end
    assert_redirected_to basics_setup_path
  end

  test "signup rejects invalid data" do
    assert_no_difference "User.count" do
      post signup_path, params: { user: { name: "", email: "", password: "" } }
    end
    assert_response :unprocessable_entity
  end

  test "login with valid credentials" do
    post login_path, params: { email: users(:admin).email, password: "password123" }
    assert_redirected_to admin_root_path
  end

  test "login rejects wrong password" do
    post login_path, params: { email: users(:admin).email, password: "wrong" }
    assert_response :unprocessable_entity
  end

  test "logout clears session" do
    sign_in users(:admin)
    delete logout_path
    assert_redirected_to root_path
  end
end
