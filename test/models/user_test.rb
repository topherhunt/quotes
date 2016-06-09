require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "email can't be blank" do
    @user = build(:user, email: "")
    refute @user.valid?
  end
end
