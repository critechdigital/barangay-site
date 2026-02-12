require "test_helper"

class ServiceTest < ActiveSupport::TestCase
  test "valid service" do
    assert services(:clearance).valid?
  end

  test "requires name" do
    svc = Service.new(site: sites(:san_antonio))
    assert_not svc.valid?
  end

  test "categories constant" do
    assert Service::CATEGORIES.include?("Certificates")
  end
end
