Given('I am on the home page') do
  visit root_path
end

Then('I should see {string}') do |text|
  assert_match text, page.body
end
