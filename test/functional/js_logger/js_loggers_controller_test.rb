require 'test_helper'

module JsLogger
  class JsLoggersControllerTest < ActionController::TestCase
    test "should get log" do
      get :log
      assert_response :success
    end
  
  end
end
