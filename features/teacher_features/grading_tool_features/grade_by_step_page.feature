Feature: Launch the Grading Tool
  In order to grade student work,
  As a teacher
  I want to be able to perform grading in the Grading Tool in Grade By Step mode
  
  Scenario: Switch between periods
    Given I am logged in as teacher1
    When I click on the "Grade by Step" "Latest Work" Grading Tool link
    And I see "Select a step below to start grading" in the Grading Tool
    And period "All Periods" is selected
    And I click on period "Period 1"
    Then period "Period 1" should be selected
    
  Scenario: Click on a step to view student work for that step
    Given I am logged in as teacher1
    When I click on the "Grade by Step" "Latest Work" Grading Tool link
    And I see "Select a step below to start grading" in the Grading Tool
    And I click on Step "1.3" in the Grading Tool
    Then I should see "STUDENT WORK" in the Grading Tool
    And I should see "TEACHER COMMENT / SCORE" in the Grading Tool
    
  Scenario: Give a score to a student who has submitted work
    Given I am logged in as teacher1
    When I click on the "Grade by Step" "Latest Work" Grading Tool link
    And I see "Select a step below to start grading" in the Grading Tool
    And I click on Step "1.3" in the Grading Tool
    And I see "STUDENT WORK" in the Grading Tool
    And I give a "score" of "$unique" to "$studentLogin1" in the Grade By "Step" page in the Grading Tool
    And I click on the "SAVE CHANGES" link in the Grading Tool
    And I click on the "Change Step" link in the Grading Tool
    And I see "Select a step below to start grading" in the Grading Tool
    And I close the Grading Tool
    And I click on the "Grade by Step" "Latest Work" Grading Tool link
    And I see "Select a step below to start grading" in the Grading Tool
    And I click on Step "1.3" in the Grading Tool
    And I see "STUDENT WORK" in the Grading Tool
    Then I should see a student with a score of "$unique" in the Grading Tool
    
  Scenario: Give a comment to a student who has submitted work
    Given I am logged in as teacher1
    When I click on the "Grade by Step" "Latest Work" Grading Tool link
    And I see "Select a step below to start grading" in the Grading Tool
    And I click on Step "1.3" in the Grading Tool
    And I see "STUDENT WORK" in the Grading Tool
    And I give a "comment" of "$unique" to "$studentLogin1" in the Grade By "Step" page in the Grading Tool
    And I click on the "SAVE CHANGES" link in the Grading Tool
    And I click on the "Change Step" link in the Grading Tool
    And I see "Select a step below to start grading" in the Grading Tool
    And I close the Grading Tool
    And I click on the "Grade by Step" "Latest Work" Grading Tool link
    And I see "Select a step below to start grading" in the Grading Tool
    And I click on Step "1.3" in the Grading Tool
    And I see "STUDENT WORK" in the Grading Tool
    Then I should see a student with a comment of "$unique" in the Grading Tool
    
  Scenario: Open the Premade Comments page
    Given I am logged in as teacher1
    When I click on the "Grade by Step" "Latest Work" Grading Tool link
    And I see "Select a step below to start grading" in the Grading Tool
    And I click on Step "1.3" in the Grading Tool
    And I see "STUDENT WORK" in the Grading Tool
    And I click on the "Open Premade Comments" link in the Grading Tool
    Then I should see the Premade Comments window open
    
  Scenario: Move to the next step using the "Next" link
    Given I am logged in as teacher1
    When I click on the "Grade by Step" "Latest Work" Grading Tool link
    And I see "Select a step below to start grading" in the Grading Tool
    And I click on Step "1.3" in the Grading Tool
    And I see "Current Step: 1.3" in the Grading Tool
    And I click on the "Next" link in the Grading Tool
    Then I should see "Current Step: 1.4" in the Grading Tool
    
  Scenario: Move to the next step using the "Previous" link
    Given I am logged in as teacher1
    When I click on the "Grade by Step" "Latest Work" Grading Tool link
    And I see "Select a step below to start grading" in the Grading Tool
    And I click on Step "1.3" in the Grading Tool
    And I see "Current Step: 1.3" in the Grading Tool
    And I click on the "Previous" link in the Grading Tool
    Then I should see "Current Step: 1.2" in the Grading Tool
    
  Scenario: Navigate back to the step selection page by clicking "Change Step"
    Given I am logged in as teacher1
    When I click on the "Grade by Step" "Latest Work" Grading Tool link
    And I see "Select a step below to start grading" in the Grading Tool
    And I click on Step "1.3" in the Grading Tool
    And I see "Current Step: 1.3" in the Grading Tool
    And I click on the "Change Step" link in the Grading Tool
    Then I should see "Select a step below to start grading" in the Grading Tool
    