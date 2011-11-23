Feature: Launch VLE
  In order to launch the VLE,
  As a student
  I want to be able to click the Run Project button to launch the VLE

  Scenario: Launch the VLE using the Run Project button
    Given I am on the home page
    When I log in as a student
    And I click on the button with id "639"
    Then I should see the div with id "contentDiv" in the VLE
