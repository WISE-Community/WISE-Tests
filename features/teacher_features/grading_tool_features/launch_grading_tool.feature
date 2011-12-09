Feature: Launch the Grading Tool
  In order to grade student work,
  As a teacher
  I want to be able to launch the Grading Tool in all four different modes
  
  Scenario: Launch the Grading Tool in "Grade By Step: Latest Work" mode
    Given I am logged in as a teacher
    When I click on the "Grade by Step" "Latest Work" Grading Tool link
    Then I should see "Select a step below to start grading" in the Grading Tool
    And I should see "Latest Work" in the Grading Tool
    
  Scenario: Launch the Grading Tool in "Grade By Step: All Revisions" mode
    Given I am logged in as a teacher
    When I click on the "Grade by Step" "All Revisions" Grading Tool link
    Then I should see "Select a step below to start grading" in the Grading Tool
    And I should see "All Revisions" in the Grading Tool
    
  Scenario: Launch the Grading Tool in "Grade By Team: Latest Work" mode
    Given I am logged in as a teacher
    When I click on the "Grade by Team" "Latest Work" Grading Tool link
    Then I should see "Select a student team below to start grading" in the Grading Tool
    And I should see "Latest Work" in the Grading Tool
    
  Scenario: Launch the Grading Tool in "Grade By Team: All Revisions" mode
    Given I am logged in as a teacher
    When I click on the "Grade by Team" "All Revisions" Grading Tool link
    Then I should see "Select a student team below to start grading" in the Grading Tool
    And I should see "All Revisions" in the Grading Tool