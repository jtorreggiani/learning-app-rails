# # frozen_string_literal: true

# module Users
#   class RegistrationsController < Devise::RegistrationsController
#     before_action :configure_sign_up_params, only: [:create]
#     before_action :configure_account_update_params, only: [:update]

#     # GET /resource/sign_up
#     # def new
#     #   super
#     # end

#     # POST /resource
#     # def create
#     #   super
#     # end

#     # GET /resource/edit

#     # PUT /resource
#     def update
#       binding.pry
#       Rails.logger.info("params: #{params.inspect}")
#       super
#     end

#     # DELETE /resource
#     # def destroy
#     #   super
#     # end

#     # GET /resource/cancel
#     # Forces the session data which is usually expired after sign
#     # in to be expired now. This is useful if the user wants to
#     # cancel oauth signing in/up in the middle of the process,
#     # removing all OAuth session data.
#     # def cancel
#     #   super
#     # end

#     protected

#     # If you have extra params to permit, append them to the sanitizer.
#     def configure_sign_up_params
#       devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
#     end

#     # If you have extra params to permit, append them to the sanitizer.
#     def configure_account_update_params
#       devise_parameter_sanitizer.permit(:account_update, keys: %i[
#                                           headline
#                                           profile_picture
#                                           username
#                                         ])
#     end

#     # The path used after sign up.
#     # def after_sign_up_path_for(resource)
#     #   super(resource)
#     # end

#     # The path used after sign up for inactive accounts.
#     # def after_inactive_sign_up_path_for(resource)
#     #   super(resource)
#     # end
#   end
# end

# Path: test/controllers/registrations_controller_test.rb

# frozen_string_literal: true

require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should get edit' do
    sign_in users(:one)
    get edit_user_registration_url
    assert_response :success
  end

  test 'should update user' do
    sign_in users(:one)
    patch user_registration_url, params: {
      user: {
        username: 'test',
        current_password: 'password'
      }
    }
    assert_redirected_to root_url
  end

  test 'should not update user' do
    sign_in users(:one)
    patch user_registration_url, params: {
      user: {
        username: 'dope!',
        current_password: ''
      }
    }
    assert_response :unprocessable_entity
  end

  test 'should destroy user' do
    sign_in users(:one)
    assert_difference('User.count', -1) do
      delete user_registration_url
    end

    assert_redirected_to root_url
  end

  test 'registration support username' do
    post user_registration_url, params: {
      user: {
        username: 'test',
        email: 'test@test.com',
        password: 'password',
        confirmation_password: 'password'
      }
    }
    assert_redirected_to root_url
  end
end
