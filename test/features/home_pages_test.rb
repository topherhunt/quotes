require "test_helper"

class HomePagesTest < Capybara::Rails::TestCase
  test "Home and About page work and are linked up properly" do
    visit home_path
    assert_content "Welcome to QuotesApp!"
    click_link "About"
    assert_content "About Us"
  end
end
