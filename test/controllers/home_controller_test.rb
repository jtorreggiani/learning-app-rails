# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should get index without redirect when not signed in' do
    get root_url
    assert_response :success
  end

  test 'should redirect to dashboard when signed in' do
    user = users(:one) # Assuming you have a users fixture
    sign_in user
    get root_url
    assert_redirected_to dashboard_path
  end
end
