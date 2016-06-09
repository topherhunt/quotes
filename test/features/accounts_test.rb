require "test_helper"

class AccountsTest < Capybara::Rails::TestCase
  test "User can register an account" do
    visit root_path
    click_on "Sign up"
    fill_in "user_email",                 with: "elmer.fudd@gmail.com"
    fill_in "user_password",              with: "foobar01"
    fill_in "user_password_confirmation", with: "foobar01"
    click_button "Sign up"
    assert_content "Log out"
    refute_content "Sign up"
    assert_content "elmer.fudd@gmail.com"
  end

  test "User can log in, change password, and log out" do
    @user = create(:user)

    visit root_path
    click_on "Log in"
    fill_in "user_email",    with: @user.email
    fill_in "user_password", with: @user.password
    click_button "Log in"
    refute_content "Log in"
    assert_content "Log out"
    click_on "Account settings"
    fill_in "user_password",              with: "foobar02"
    fill_in "user_password_confirmation", with: "foobar02"
    fill_in "user_current_password",      with: @user.password
    click_on "Update"
    assert_content "Your account has been updated successfully."
    assert @user.reload.valid_password?("foobar02")
    click_on "Log out"
    assert_content "Log in"
    refute_content "Log out"
  end
end
