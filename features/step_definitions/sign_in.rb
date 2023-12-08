Given('I am a registered user') do
  @registered_user = User.create!(email: 'user2@example.com', password: 'password', password_confirmation: 'password')
end

When('I visit the login page') do
  visit new_user_session_path
end

When('I fill in the login form with valid credentials') do
  fill_in 'Email', with: @registered_user.email
  fill_in 'Password', with: @registered_user.password
end

When('I fill in the login form with invalid credentials') do
  fill_in 'Email', with: @registered_user.email
  fill_in 'Password', with: 'wrongpassword'
end

When('I click the {string} button') do |button|
  click_button button
end

Then('I should be redirected to the home page') do
  assert_equal current_path, dashboard_path
end

Then('I should see a successful login message') do
  assert page.has_content?('Signed in successfully.')
end

Then('I should be on the login page') do
  assert_equal new_user_session_path, current_path
end

Then('I should see an invalid login message') do
  assert page.has_content?('Invalid Email or password.')
end

# Given('I am logged in') do
#   @registered_user = User.create!(email: 'user2@example.com', password: 'password', password_confirmation: 'password')
#   visit new_user_session_path
#   fill_in 'Email', with: @registered_user.email
#   fill_in 'Password', with: @registered_user.password
#   click_button 'Log in'
# end
  