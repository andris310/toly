require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #menu a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'a', 'ebook of Stretches'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
