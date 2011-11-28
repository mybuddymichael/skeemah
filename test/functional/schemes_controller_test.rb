require 'test_helper'

class SchemesControllerTest < ActionController::TestCase

  test 'redirect to splash if not logged in' do
    get :new, {}, {id: nil}
    assert_redirected_to :root
  end

  test 'gets new if logged in' do
    get :new, {}, {id: 1}
    assert_response :success
  end

end
