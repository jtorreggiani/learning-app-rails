Feature: Home page
  As a visitor
  I want to visit the home page
  So I can see welcome text

  Scenario: Visit the Home Page
    Given I am on the home page
    Then I should see "Learning App Rails"
