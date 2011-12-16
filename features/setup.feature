#use this file as a temporary work space to create your scenario so
#that when you are developing the test you don't need to run any other
#tests. once you are satisfied with your test, move it to an appropriate 
#.feature file. this file should never be committed.

@setup
Feature: Run the setup to create the features/setup_variables.rb file
  
  Scenario: Run the setup to create the accounts, projects, and runs
    Given I create the setup_variables.rb file
    And I create the admin account
    And I create the teacher 1 account
    And I create the teacher 2 account
    And I create the project
    And I create the run
    And I create the student 1 account
    And I create the student 2 account
    And I create the student 3 account
    Then I am done with the setup
    
