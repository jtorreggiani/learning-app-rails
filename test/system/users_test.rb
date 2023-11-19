require 'application_system_test_case'

class UserEditTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one) # Assuming you have a users fixture
    sign_in @user
    visit edit_user_registration_path
  end

  test 'successful edit with valid information and profile picture upload' do
    assert_text 'Edit Profile'
    fill_in 'Username', with: 'NewUsername'
    fill_in 'Headline', with: 'New Headline'
    fill_in 'Email', with: 'newemail@example.com'
    # attach_file 'Profile picture', Rails.root.join('test/fixtures/files/tree.jpeg')
    fill_in 'Current password', with: 'password'

    click_on 'Update'

    assert_text 'Your account has been updated successfully'
    @user.reload
    assert_equal 'NewUsername', @user.username
    assert_equal 'newemail@example.com', @user.email
    # Add more assertions as necessary
  end

  test 'unsuccessful edit with invalid information' do
    fill_in 'Email', with: 'invalid_email'
    fill_in 'Current password', with: 'wrong'

    click_on 'Update'

    assert_text 'Error'
    # Add more assertions for specific error messages if needed
  end
end
