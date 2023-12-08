Feature: User Login
  As a user
  I want to log in using my email and password
  So that I can access protected areas of the site

  Scenario: Logging in with valid credentials
    Given I am a registered user
    When I visit the login page
    And I fill in the login form with valid credentials
    And I click the "Log in" button
    Then I should be redirected to the home page
    And I should see a successful login message

  Scenario: Logging in with invalid credentials
    Given I am a registered user
    When I visit the login page
    And I fill in the login form with invalid credentials
    And I click the "Log in" button
    Then I should be on the login page
    And I should see an invalid login message