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

  Scenario: Share a project
    Given I am logged in as teacher2
    And I click on the "Management" link
    When I click on the "Browse WISE Projects" link
    And I click on the "Owned (My Custom Projects)" link
    And I wait "3" seconds
    And I click on the first link with class "shareProject" within the "myProjects" element
    And I see "Sharing Permissions"
    And I enter "$teacherLogin1" into the "sharedOwnerUsernameInput" field in the "shareIfrm" frame
    And I click on the "Save" button in the "shareIfrm" frame
    Then I should see "$teacherLogin1" in the "sharedProjectPermissions" element in the "shareIfrm" frame

  Scenario: Browse projects shared with me
    Given I am logged in as teacher1
    When I click on the "Browse WISE Projects" link
    And I click on the "Shared" link
    Then I should see "Owned by"
