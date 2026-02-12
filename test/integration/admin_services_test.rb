require "test_helper"

class AdminServicesTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:admin)
  end

  test "index lists services" do
    get admin_services_path
    assert_response :success
  end

  test "new form renders" do
    get new_admin_service_path
    assert_response :success
  end

  test "create service" do
    assert_difference "Service.count", 1 do
      post admin_services_path, params: { service: {
        name: "New Service",
        category: "Certificates",
        fees: "₱50",
        processing_time: "1 day"
      } }
    end
    assert_redirected_to admin_services_path
  end

  test "edit form renders" do
    get edit_admin_service_path(services(:clearance))
    assert_response :success
  end

  test "update service" do
    patch admin_service_path(services(:clearance)), params: { service: { fees: "₱200" } }
    assert_redirected_to admin_services_path
    assert_equal "₱200", services(:clearance).reload.fees
  end

  test "delete service" do
    assert_difference "Service.count", -1 do
      delete admin_service_path(services(:clearance))
    end
    assert_redirected_to admin_services_path
  end

  test "requires login" do
    delete logout_path
    get admin_services_path
    assert_redirected_to login_path
  end
end
