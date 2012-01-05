Feature: Copy project
  In order to copy a project,
  As a teacher
  I want to be able to find a project and copy it
  
  Scenario: Copy a project
    Given I am logged in as teacher2
    And I click on the "Management" link
    When I click on the "Browse WISE Projects" link
    And I click on the "Owned (My Custom Projects)" link
    And I search for project "Test Project"
    And I count the number of projects with the title "Test Project"
    And I click on the "Management" link
    And I click on the "Browse WISE Projects" link
    And I click on the "Owned (My Custom Projects)" link
    And I search for project "Test Project"
    And I click on the "Copy (Customize)" link
    And I click on the "OK" button
    And I see "Successfully copied"
    And I click on the "OK" button
    And I click on the "Owned (My Custom Projects)" link
    And I search for project "Test Project"
    Then I should see the number of projects with the title "Test Project" increase
