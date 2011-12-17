Feature: Launch VLE
  In order to launch the VLE,
  As a student
  I want to be able to click the Run Project button to launch the VLE

  Scenario: Launch the VLE using the Run Project button for the first time
    Given I am on the home page
    When I log in as a student
    And I launch the test run for the first time
    Then I should see the div with id "contentDiv" in the VLE

  Scenario: Launch the VLE using the Run Project button
    Given I am on the home page
    When I log in as a student
    And I launch the test run
    Then I should see the div with id "contentDiv" in the VLE