Feature: Admin Login
  In order to manage the WISE4 portal
  As a person with admin credentials
  I want to be able to login using those credentials

  Scenario: Admin Login
    Given I am on the home page
    And I have entered "admin" into the "Username" field
    And I have entered "pass" into the "Password" field
    When I click the "Sign In" button
    Then I should see "Welcome to the WISE Administrator Page"