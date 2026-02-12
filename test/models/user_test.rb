require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = User.new(name: "Test", email: "test@example.com", password: "password123", password_confirmation: "password123")
    assert user.valid?
  end

  test "requires email" do
    user = User.new(name: "Test", password: "password123")
    assert_not user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end

  test "requires unique email" do
    user = User.new(name: "Test", email: users(:admin).email, password: "password123")
    assert_not user.valid?
    assert_includes user.errors[:email], "has already been taken"
  end

  test "requires name" do
    user = User.new(email: "x@x.com", password: "password123")
    assert_not user.valid?
    assert_includes user.errors[:name], "can't be blank"
  end

  test "rejects invalid email format" do
    user = User.new(name: "Test", email: "notanemail", password: "password123")
    assert_not user.valid?
  end

  test "authenticates with correct password" do
    user = users(:admin)
    assert user.authenticate("password123")
  end

  test "rejects wrong password" do
    user = users(:admin)
    assert_not user.authenticate("wrong")
  end

  test "has many sites" do
    assert_respond_to users(:admin), :sites
  end
end
