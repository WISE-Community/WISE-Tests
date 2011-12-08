Feature: VLE global tools
  In order to perform navigate a project,
  As a student
  I want to be able to use the global tools
  
  Scenario: Use the navigation menu
    Given I am logged in as a student
    When I launch run "639"
    And I click on Step "1.2" in the VLE navigation menu
    Then I should see "Explanation Builder" in the step
    
  Scenario: Save student work in a step
    Given I am logged in as a student
    When I launch run "639"
    And I click on Step "1.7" in the VLE navigation menu
    And I see "Write your answer here." in the step

  Scenario: Click the Full Screen button
    Given I am logged in as a student
    When I launch run "639"
    And I see the project name "My Test Project3" in the VLE
    And I click on the "Full Screen" link in the VLE
    Then I should not see the project name in the VLE

  Scenario: Click the Flagged button
    Given I am logged in as a student
    When I launch run "639"
    And I click on the "Flagged" link in the VLE
    Then I should see "Flagged Work" in the VLE
    And I should see "Choose a step" in the VLE

  Scenario: Click the My Work button
    Given I am logged in as a student
    When I launch run "639"
    And I click on the "My Work" link in the VLE
    Then I should see "My Work (with Teacher Feedback and Scores)" in the VLE
    And I should see "All Work" in the VLE

  Scenario: Click the Add Idea button
    Given I am logged in as a student
    When I launch run "639"
    And I click on the "Add Idea" link in the VLE
    Then I should see "Add an Idea" in the VLE
    And I should see "Type your idea here" in the VLE

  Scenario: Click the Ideas button
    Given I am logged in as a student
    When I launch run "639"
    And I click on the "Ideas" link in the VLE
    Then I should see "Idea Basket" in the Idea Basket in the VLE
    And I should see "Ideas for this Project" in the Idea Basket in the VLE

  Scenario: Click the Files button
    Given I am logged in as a student
    When I launch run "639"
    And I click on the "Files" link in the VLE
    Then I should see "My Files" in the VLE
    
  Scenario: Click the Home button
    Given I am logged in as a student
    When I launch run "639"
    And I click on the "Home" link in the VLE
    Then I should see "Student Home"

  Scenario: Click the Sign Out button
    Given I am logged in as a student
    When I launch run "639"
    And I click on the "Sign Out" link in the VLE
    Then I should see "Sign in to WISE"

  Scenario: Save student work in a step
    Given I am logged in as a student
    When I launch run "639"
    And I click on Step "1.7" in the VLE navigation menu
    And I see "open response" in the step
    And I see the element with id "responseBox" in the step
    And I enter "Hello" into the "responseBox" in the step
    And I click on Step "1.1" in the VLE navigation menu
    And I click on the "Home" link in the VLE
    And I launch run "639"
    And I click on Step "1.7" in the VLE navigation menu
    Then I should see "Hello" in the element with id "responseBox" in the step