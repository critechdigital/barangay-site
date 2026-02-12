require "test_helper"

class FoiRequestTest < ActiveSupport::TestCase
  test "valid request" do
    assert foi_requests(:request1).valid?
  end

  test "requires name" do
    req = FoiRequest.new(site: sites(:san_antonio), email: "x@x.com", purpose: "Test", description: "Test")
    assert_not req.valid?
  end

  test "requires valid email" do
    req = FoiRequest.new(site: sites(:san_antonio), name: "Test", email: "bad", purpose: "Test", description: "Test")
    assert_not req.valid?
  end

  test "generates tracking number on create" do
    req = FoiRequest.create!(site: sites(:san_antonio), name: "Test", email: "t@t.com", purpose: "Research", description: "Need data")
    assert req.tracking_number.start_with?("FOI-")
  end

  test "sets received_at on create" do
    req = FoiRequest.create!(site: sites(:san_antonio), name: "Test", email: "t@t.com", purpose: "Research", description: "Need data")
    assert_not_nil req.received_at
  end

  test "status enum works" do
    req = foi_requests(:request1)
    assert req.received?
    req.processing!
    assert req.processing?
  end
end
