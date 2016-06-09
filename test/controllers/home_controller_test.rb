require "test_helper"

class HomeControllerTest < ActionController::TestCase
  tests HomeController

  context "#home" do
    test "does nothing" do
      get :home
      assert_equal 200, response.status
    end
  end
end
