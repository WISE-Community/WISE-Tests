Feature: Access the Compatibility Checker
  In order to check if my browser can run WISE4,
  Without logging in
  I want to be able to access the Compatibility Checker page
  
  Scenario: Go to the Browse WISE Curricula page
    Given I am on the home page
    When I click on the "Check Compatibility" link
    And I see "WISE4 System Check"