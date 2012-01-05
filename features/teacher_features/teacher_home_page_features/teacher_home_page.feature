Feature: Access teacher pages
  In order to perform teacher actions,
  As a teacher
  I want to be able to access teacher pages
  
  Scenario: Access Browse WISE Projects page
    Given I am logged in as teacher1
    When I click on the "Management" link
    And I click on the "Browse WISE Projects" link
    Then I should see "Project Library"
    
  Scenario: Access Grade & Manage Classroom Runs page
    Given I am logged in as teacher1
    When I click on the "Management" link
    And I click on the "Grade & Manage Classroom Runs" link
    Then I should see "My Classroom Runs"
    
  Scenario: Access Teacher Home page
    Given I am logged in as teacher1
    When I click on the "Management" link
    And I click on the "Teacher Home" link
    Then I should see "Recent Activity"