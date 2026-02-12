require "test_helper"

class PublicSiteTest < ActionDispatch::IntegrationTest
  test "shows published site" do
    get public_site_path(sites(:san_antonio).slug)
    assert_response :success
    assert_select "h1", /San Antonio/
  end

  test "redirects for unpublished site" do
    get public_site_path(sites(:unpublished).slug)
    assert_redirected_to root_path
  end

  test "redirects for nonexistent site" do
    get public_site_path("nonexistent-slug")
    assert_redirected_to root_path
  end

  test "services page renders" do
    get public_site_services_path(sites(:san_antonio).slug)
    assert_response :success
  end

  test "officials page renders" do
    get public_site_officials_path(sites(:san_antonio).slug)
    assert_response :success
  end

  test "announcements page renders" do
    get public_site_announcements_path(sites(:san_antonio).slug)
    assert_response :success
  end

  test "contact page renders" do
    get public_site_contact_path(sites(:san_antonio).slug)
    assert_response :success
  end

  test "transparency page renders" do
    get public_site_transparency_path(sites(:san_antonio).slug)
    assert_response :success
  end
end
