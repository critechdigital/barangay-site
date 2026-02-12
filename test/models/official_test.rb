require "test_helper"

class OfficialTest < ActiveSupport::TestCase
  test "valid official" do
    assert officials(:captain).valid?
  end

  test "requires name" do
    official = Official.new(site: sites(:san_antonio), position: "Captain")
    assert_not official.valid?
  end

  test "requires position" do
    official = Official.new(site: sites(:san_antonio), name: "Juan")
    assert_not official.valid?
  end
end
