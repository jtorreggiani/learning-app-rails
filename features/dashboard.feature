Feature: Dashboard access
  As a registered user
  I want to access the dashboard
  So that I can see my posts

  Scenario: Accessing the dashboard without login
    Given I am not authenticated
    When I visit the dashboard page
    Then I should be redirected to the sign in page

  Scenario: Accessing the dashboard with login
    Given I am a registered user
    And I am logged in
    When I visit the dashboard page
    Then I should see my dashboard