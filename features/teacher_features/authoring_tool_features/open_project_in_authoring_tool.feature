Feature: Open project in Authoring Tool
  In order to author a project,
  As a teacher
  I want to be able to open a project in the Authoring Tool
    
  Scenario: Launch authoring tool and open a project
    Given I am logged in as a teacher
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "openProjectButton" button in the Authoring Tool
    And I choose project "596" from the "selectProject" dropdown in the Authoring Tool
    Then I should see project "596" loaded in the Authoring Tool
