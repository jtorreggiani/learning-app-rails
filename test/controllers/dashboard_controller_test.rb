# frozen_string_literal: true

require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'redirects unauthorized users' do
    get dashboard_url
    assert_redirected_to new_user_session_path
  end

  test 'permits authorized users' do
    sign_in users(:one)
    get dashboard_url
    assert_response :success
  end

  test 'renders username' do
    sign_in users(:one)
    get dashboard_url
    assert_match 'jsmith', response.body
  end

  test 'renders profile picture' do
    sign_in users(:one)
    get dashboard_url
    assert_response :success

    assert_select 'img' do |elements|
      assert(elements.any? { |e| e['src'].include?('tree.jpeg') })
    end
  end
end
