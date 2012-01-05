Feature: Browse projects
  In order to browse projects,
  As a teacher
  I want to be able to browse the library projects, projects I own, and projects that are shared with me
  
  Scenario: Browse library projects
    Given I am logged in as teacher1
    When I click on the "Browse WISE Projects" link
    Then I should see "WISE Library Project"

  Scenario: Browse projects I own
    Given I am logged in as teacher1
    When I click on the "Browse WISE Projects" link
    And I click on the "Owned (My Custom Projects)" link
    Then I should see "$projectId1"

  Scenario: Browse projects shared with me
    Given I am logged in as teacher1
    When I click on the "Browse WISE Projects" link
    And I click on the "Shared" link
    Then I should see "Shared by"
