# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get profile' do
    get profile_path(users(:one))
    assert_response :success
  end
end
