Feature: Share project
  In order to share a project,
  As a teacher
  I want to be able to find a project and share it

  Scenario: Share a project
    Given I am logged in as a teacher
    And I click on the "Management" link
    When I click on the "Browse WISE Projects" link
    And I click on the "Owned (My Custom Projects)" link
    And I click on the "Share" link within the "myProjects" element
    And I see "Sharing Permissions"
    And I enter "$teacherLogin2" into the "sharedOwnerUsernameInput" field in the "shareIfrm" frame
    And I click on the "Save" button in the "shareIfrm" frame
    Then I should see "$teacherLogin2" in the "sharedProjectPermissions" element in the "shareIfrm" frame