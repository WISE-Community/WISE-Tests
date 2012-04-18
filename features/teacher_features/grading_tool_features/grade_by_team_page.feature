Feature: Launch the Grading Tool
  In order to grade student work,
  As a teacher
  I want to be able to perform grading in the Grading Tool in Grade By Team mode
  
  Scenario: Switch between periods
    Given I am logged in as teacher1
    When I click on the "Grade by Team" "Latest Work" Grading Tool link
    And I see "Select a student team below to start grading" in the Grading Tool
    And period "All Periods" is selected
    And I click on period "Period 1"
    Then period "Period 1" should be selected
    
  Scenario: Click on a workgroup to view student work for that workgroup
    Given I am logged in as teacher1
    When I click on the "Grade by Team" "Latest Work" Grading Tool link
    And I see "Select a student team below to start grading" in the Grading Tool
    And I click on student1 in the Grading Tool
    Then I should see "STUDENT WORK" in the Grading Tool
    And I should see "TEACHER COMMENT / SCORE" in the Grading Tool
      
  Scenario: Give a score to a student who has submitted work (this test tends to fail even when nothing is wrong)
    Given I am logged in as teacher1
    When I click on the "Grade by Team" "Latest Work" Grading Tool link
    And I see "Select a student team below to start grading" in the Grading Tool
    And I click on student1 in the Grading Tool
    And I see "STUDENT WORK" in the Grading Tool
    And I give a "score" of "1" to "1.3 Step" in the Grade By "Team" page in the Grading Tool
    And I click on the "SAVE CHANGES" link in the Grading Tool
    And I give a "score" of "$unique" to "1.3 Step" in the Grade By "Team" page in the Grading Tool
    And I click on the "SAVE CHANGES" link in the Grading Tool
    And I click on the "Change Team" link in the Grading Tool
    And I see "Select a student team below to start grading" in the Grading Tool
    And I close the Grading Tool
    And I click on the "Grade by Team" "Latest Work" Grading Tool link
    And I see "Select a student team below to start grading" in the Grading Tool
    And I click on student1 in the Grading Tool
    And I see "STUDENT WORK" in the Grading Tool
    Then I should see a student with a score of "$unique" in the Grading Tool
    
  Scenario: Give a comment to a student who has submitted work (this test tends to fail even when nothing is wrong)
    Given I am logged in as teacher1
    When I click on the "Grade by Team" "Latest Work" Grading Tool link
    And I see "Select a student team below to start grading" in the Grading Tool
    And I click on student1 in the Grading Tool
    And I see "STUDENT WORK" in the Grading Tool
    And I give a "comment" of "abc" to "1.3 Step" in the Grade By "Team" page in the Grading Tool
    And I click on the "SAVE CHANGES" link in the Grading Tool
    And I give a "comment" of "$unique" to "1.3 Step" in the Grade By "Team" page in the Grading Tool
    And I click on the "SAVE CHANGES" link in the Grading Tool
    And I click on the "Change Team" link in the Grading Tool
    And I see "Select a student team below to start grading" in the Grading Tool
    And I close the Grading Tool
    And I click on the "Grade by Team" "Latest Work" Grading Tool link
    And I see "Select a student team below to start grading" in the Grading Tool
    And I click on student1 in the Grading Tool
    And I see "STUDENT WORK" in the Grading Tool
    Then I should see a student with a comment of "$unique" in the Grading Tool
    
  Scenario: Open the Premade Comments page
    Given I am logged in as teacher1
    When I click on the "Grade by Team" "Latest Work" Grading Tool link
    And I see "Select a student team below to start grading" in the Grading Tool
    And I click on student1 in the Grading Tool
    And I see "STUDENT WORK" in the Grading Tool
    And I click on the "Open Premade Comments" link in the Grading Tool
    Then I should see the Premade Comments window open
    
  Scenario: Navigate back to the team selection page by clicking "Change Team"
    Given I am logged in as teacher1
    When I click on the "Grade by Team" "Latest Work" Grading Tool link
    And I see "Select a student team below to start grading" in the Grading Tool
    And I click on student1 in the Grading Tool
    And I see "Current Team:" in the Grading Tool
    And I click on the "Change Team" link in the Grading Tool
    Then I should see "Select a student team below to start grading" in the Grading Tool