require "test_helper"

class HomePagesTest < Capybara::Rails::TestCase
  test "Home and About page work and are linked up properly" do
    visit home_path
    assert_content "Welcome to VanillaApp!"
    click_link "About"
    assert_content "About Us"
  end
end
