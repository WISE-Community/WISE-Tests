Feature: Launch Authoring Tool
  In order to author a project,
  As a teacher
  I want to be able to launch the Authoring Tool
  
  Scenario: Launch authoring tool
    Given I am logged in as a teacher
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    Then I should see "Exit to Home" in the Authoring Tool
    
