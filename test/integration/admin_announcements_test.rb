require "test_helper"

class AdminAnnouncementsTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:admin)
  end

  test "index lists announcements" do
    get admin_announcements_path
    assert_response :success
  end

  test "new form renders" do
    get new_admin_announcement_path
    assert_response :success
  end

  test "create announcement" do
    assert_difference "Announcement.count", 1 do
      post admin_announcements_path, params: { announcement: {
        title: "New Post",
        body: "Hello community!",
        published: true
      } }
    end
    assert_redirected_to admin_announcements_path
  end

  test "edit form renders" do
    get edit_admin_announcement_path(announcements(:assembly))
    assert_response :success
  end

  test "update announcement" do
    patch admin_announcement_path(announcements(:assembly)), params: { announcement: { title: "Updated Title" } }
    assert_redirected_to admin_announcements_path
    assert_equal "Updated Title", announcements(:assembly).reload.title
  end

  test "delete announcement" do
    assert_difference "Announcement.count", -1 do
      delete admin_announcement_path(announcements(:assembly))
    end
    assert_redirected_to admin_announcements_path
  end

  test "requires login" do
    delete logout_path
    get admin_announcements_path
    assert_redirected_to login_path
  end
end
