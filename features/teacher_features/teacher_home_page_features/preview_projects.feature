Feature: Preview project 
  In order to preview projects,
  As a teacher
  I want to be able to preview a project from the teacher home page, browse projects page, and grade & manage classroom runs page
  
  Scenario: Preview a project from the Teacher Home page
    Given I am logged in as a teacher
    When I click on the "Preview" link
    Then I should see the preview window open
    
  Scenario: Preview a project from the Browse WISE Projects page
    Given I am logged in as a teacher
    When I click on the "Preview" link
    Then I should see the preview window open
  
  Scenario: Preview a project from the Grade & Manage Classroom Runs page
    Given I am logged in as a teacher
    When I click on the "Grade & Manage Classroom Runs" link
    And I click on the "Preview" link
    Then I should see the preview window open
  
  Scenario: Preview a project from the Grade & Manage Classroom Runs page from the Project Details popup
    Given I am logged in as a teacher
    When I click on the "Grade & Manage Classroom Runs" link
    And I click on the "16" link
    And I click on the "Preview" link
    Then I should see the preview window open