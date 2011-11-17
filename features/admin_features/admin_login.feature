Feature: Admin Login
  In order to manage the WISE4 portal
  As a person with admin credentials
  I want to be able to login using those credentials

  Scenario: Admin Login
    Given I am logged in as an admin
    Then I should see "WISE Administrator Tools"
