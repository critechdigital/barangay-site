require "test_helper"

class HomeTest < ActionDispatch::IntegrationTest
  test "landing page renders" do
    get root_path
    assert_response :success
    assert_select "h1", /Barangay Online/
  end

  test "shows signup link" do
    get root_path
    assert_select "a[href=?]", signup_path
  end
end
