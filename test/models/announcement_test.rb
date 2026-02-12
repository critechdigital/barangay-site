require "test_helper"

class AnnouncementTest < ActiveSupport::TestCase
  test "valid announcement" do
    assert announcements(:assembly).valid?
  end

  test "requires title" do
    ann = Announcement.new(site: sites(:san_antonio), body: "test")
    assert_not ann.valid?
    assert_includes ann.errors[:title], "can't be blank"
  end

  test "requires body" do
    ann = Announcement.new(site: sites(:san_antonio), title: "test")
    assert_not ann.valid?
    assert_includes ann.errors[:body], "can't be blank"
  end

  test "published scope" do
    published = sites(:san_antonio).announcements.published
    assert_includes published, announcements(:assembly)
    assert_not_includes published, announcements(:draft)
  end

  test "sets published_at on publish" do
    ann = Announcement.new(site: sites(:san_antonio), title: "New", body: "Content", published: true)
    ann.save!
    assert_not_nil ann.published_at
  end

  test "recent scope limits to 5" do
    assert sites(:san_antonio).announcements.recent.limit_value <= 5
  end
end
