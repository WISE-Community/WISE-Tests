Feature: Create run
  In order to create a run,
  As a teacher
  I want to be able to navigate through the setup a classroom run wizard
  
  Scenario: Create a run using the setup a classroom run wizard
    Given I am logged in as teacher2
    When I click on the "Browse WISE Projects" link
    And I click on the "Owned (My Custom Projects)" link
    And I search for project "Test Project"
    And I click on the "Start New Run" link
    And I click on the "Next" button
    And I click on the "Next" button
    And I click on the "PERIOD_1" checkbox
    And I click on the "Next" button
    And I click on the "Next" button
    And I click on the "Done" button
    Then I should see "Classroom Run Created!"
    