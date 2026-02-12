require "test_helper"

class PublicSiteTest < ActionDispatch::IntegrationTest
  test "shows published site" do
    get public_site_path(sites(:san_antonio).slug)
    assert_response :success
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

  test "charter page renders" do
    get public_site_charter_path(sites(:san_antonio).slug)
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

  test "documents page renders" do
    get public_site_documents_path(sites(:san_antonio).slug)
    assert_response :success
  end

  test "emergency page renders" do
    get public_site_emergency_path(sites(:san_antonio).slug)
    assert_response :success
  end

  test "foi page renders" do
    get public_site_foi_path(sites(:san_antonio).slug)
    assert_response :success
  end

  test "submit foi request" do
    assert_difference "FoiRequest.count", 1 do
      post public_site_foi_path(sites(:san_antonio).slug), params: { foi_request: {
        name: "Test User",
        email: "test@example.com",
        purpose: "Academic / Research",
        description: "Requesting budget data"
      } }
    end
    assert_response :redirect
  end

  test "track foi request" do
    get public_site_foi_track_path(sites(:san_antonio).slug, tracking: foi_requests(:request1).tracking_number)
    assert_response :success
  end
end
