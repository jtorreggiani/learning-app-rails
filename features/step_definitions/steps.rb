# frozen_string_literal: true

World(Devise::TestHelpers)

Given('I am on the home page') do
  visit root_path
end

Then('I should see {string}') do |text|
  assert_match text, page.body
end

Given('I am not authenticated') do
  # Nothing to do here since the user is not logged in by default
end

# Given('I am a registered user') do
#   User.destroy_all
#   User.create!(
#     username: 'Jane Doe',
#     email: 'user@example.com',
#     password: 'password',
#     password_confirmation: 'password'
#   )
# end

# Given('I am logged in') do
#   sign_in @user
# end

When('I visit the dashboard page') do
  visit dashboard_path
end

Then('I should be redirected to the sign in page') do
  assert_equal current_path, new_user_session_path
end

Then('I should see my dashboard') do
  assert_match @user.username
end
