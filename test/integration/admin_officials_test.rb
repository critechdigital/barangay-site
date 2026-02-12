require "test_helper"

class AdminOfficialsTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:admin)
  end

  test "index lists officials" do
    get admin_officials_path
    assert_response :success
  end

  test "new form renders" do
    get new_admin_official_path
    assert_response :success
  end

  test "create official" do
    assert_difference "Official.count", 1 do
      post admin_officials_path, params: { official: {
        name: "New Official",
        position: "Barangay Kagawad",
        sort_order: 5
      } }
    end
    assert_redirected_to admin_officials_path
  end

  test "edit form renders" do
    get edit_admin_official_path(officials(:captain))
    assert_response :success
  end

  test "update official" do
    patch admin_official_path(officials(:captain)), params: { official: { name: "Updated Name" } }
    assert_redirected_to admin_officials_path
    assert_equal "Updated Name", officials(:captain).reload.name
  end

  test "delete official" do
    assert_difference "Official.count", -1 do
      delete admin_official_path(officials(:captain))
    end
    assert_redirected_to admin_officials_path
  end

  test "requires login" do
    delete logout_path
    get admin_officials_path
    assert_redirected_to login_path
  end
end
