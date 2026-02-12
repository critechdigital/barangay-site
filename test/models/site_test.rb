require "test_helper"

class SiteTest < ActiveSupport::TestCase
  test "valid site" do
    site = sites(:san_antonio)
    assert site.valid?
  end

  test "requires name" do
    site = Site.new(user: users(:admin))
    assert_not site.valid?
    assert_includes site.errors[:name], "can't be blank"
  end

  test "generates slug from name" do
    site = Site.new(name: "Barangay Maligaya", user: users(:admin))
    site.valid?
    assert_equal "barangay-maligaya", site.slug
  end

  test "requires unique slug" do
    site = Site.new(name: "Test", slug: "barangay-san-antonio", user: users(:editor))
    assert_not site.valid?
    assert_includes site.errors[:slug], "has already been taken"
  end

  test "slug format validation" do
    site = Site.new(name: "Test", slug: "INVALID SLUG!", user: users(:admin))
    assert_not site.valid?
    assert_includes site.errors[:slug], "is invalid"
  end

  test "published scope" do
    published = Site.published
    assert_includes published, sites(:san_antonio)
    assert_not_includes published, sites(:unpublished)
  end

  test "has many officials" do
    assert_equal 2, sites(:san_antonio).officials.count
  end

  test "has many services" do
    assert_equal 2, sites(:san_antonio).services.count
  end

  test "public_url with subdomain" do
    site = sites(:san_antonio)
    assert_equal "san-antonio.barangaysite.ph", site.public_url
  end

  test "public_url without subdomain" do
    site = sites(:unpublished)
    assert_equal "barangaysite.ph/barangay-test", site.public_url
  end

  test "common services constant" do
    assert Site::COMMON_SERVICES.length >= 8
    assert Site::COMMON_SERVICES.first.key?(:name)
  end
end
