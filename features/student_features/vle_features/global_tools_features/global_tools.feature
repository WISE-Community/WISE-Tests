Feature: VLE global tools
  In order to perform navigate a project,
  As a student
  I want to be able to use the global tools
  
  Scenario: Use the navigation menu
    Given I am logged in as student1
    When I launch the test run
    And I click on Step "1.3" in the VLE navigation menu
    Then I should see "This is the second Open Response step." in the step

  Scenario: Click the Full Screen button
    Given I am logged in as student1
    When I launch the test run
    And I see the project name "Test Project" in the VLE
    And I click on the "Full Screen" link in the VLE
    Then I should not see the project name in the VLE

  Scenario: Click the Flagged button
    Given I am logged in as student1
    When I launch the test run
    And I click on the "Flagged" link in the VLE
    Then I should see "Flagged Work" in the VLE

  Scenario: Click the My Work button
    Given I am logged in as student1
    When I launch the test run
    And I click on the "My Work" link in the VLE
    Then I should see "My Work (with Teacher Feedback and Scores)" in the VLE
    And I should see "% of Project Completed" in the VLE

  Scenario: Click the Add Idea button
    Given I am logged in as student1
    When I launch the test run
    And I click on the "Add Idea" link in the VLE
    Then I should see "Type your idea here" in the VLE

  Scenario: Click the Ideas button
    Given I am logged in as student1
    When I launch the test run
    And I click on the "Ideas" link in the VLE
    Then I should see "Idea Basket" in the Idea Basket in the VLE
    And I should see "Private Idea Basket" in the Idea Basket in the VLE

  Scenario: Click the Files button
    Given I am logged in as student1
    When I launch the test run
    And I click on the "Files" link in the VLE
    Then I should see "My Files" in the VLE
    
  Scenario: Click the Home button
    Given I am logged in as student1
    When I launch the test run
    And I click on the "Home" link in the VLE
    Then I should see "Student Home"

  Scenario: Click the Sign Out button
    Given I am logged in as student1
    When I launch the test run
    And I click on the "Sign Out" link in the VLE
    Then I should see the "j_username" element

  Scenario: Save student work in a step
    Given I am logged in as student1
    When I launch the test run
    And I click on Step "1.3" in the VLE navigation menu
    And I see "This is the second Open Response step." in the step
    And I see the element with id "responseBox" in the step
    And I enter "Hello" into the "responseBox" in the step
    And I click on Step "1.2" in the VLE navigation menu
    And I click on the "Home" link in the VLE
    And I launch the test run
    And I click on Step "1.3" in the VLE navigation menu
    Then I should see "Hello" in the element with id "responseBox" in the step