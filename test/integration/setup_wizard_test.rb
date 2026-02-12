require "test_helper"

class SetupWizardTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:admin)
  end

  test "basics step renders" do
    get basics_setup_path
    assert_response :success
  end

  test "update basics saves site info" do
    patch basics_setup_path, params: { site: {
      name: "Barangay Updated",
      region: "NCR",
      province: "Metro Manila",
      municipality: "Manila"
    } }
    assert_redirected_to officials_setup_path
  end

  test "officials step renders" do
    get officials_setup_path
    assert_response :success
  end

  test "services step renders" do
    get services_setup_path
    assert_response :success
  end

  test "contact step renders" do
    get contact_setup_path
    assert_response :success
  end

  test "preview step renders" do
    get preview_setup_path
    assert_response :success
  end

  test "publish makes site live" do
    patch publish_setup_path
    users(:admin).sites.first.reload
    assert users(:admin).sites.first.published?
  end
end
