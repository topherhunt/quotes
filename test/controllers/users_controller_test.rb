require "test_helper"

class UsersControllerTest < ActionController::TestCase
  tests UsersController

  context "#show" do
    test "assigns the @user object" do
      @user = create(:user)

      get :show, id: @user.id
      assert_equal @user, assigns(:user)
    end
  end
end
