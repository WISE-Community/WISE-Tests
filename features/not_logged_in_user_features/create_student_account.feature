Feature: Create Student Account

  Scenario: Go to Student Registration page
    Given I am on the home page
    When I click on the "Create WISE Account" link
    Then I should see "New Account Registration"
    When I click on the "Student Account" link
    Then I should see "Student Registration"    
    
  Scenario: Fill in all required information correctly
    Given I am on the Student Registration page
    And I have entered "a" into the "firstname" field
    And I have entered "a" into the "lastname" field
    And I choose "Male" from the "gender" dropdown
    And I choose "1" from the "birthmonth" dropdown
    And I choose "1" from the "birthdate" dropdown
    And I have entered "a" into the "password" field
    And I have entered "a" into the "repeatedPassword" field
    And I choose "What is your middle name" from the "accountQuestion" dropdown
    And I have entered "a" into the "accountAnswer" field
    And I have entered "Cobra853" into the "runCode_part1" field
    And I click on the "Show Class Periods" link
    And I choose "1" from the "runCode_part2" dropdown    
    When I click on the "Create Account" link
    Then I should see "Account Created!"
    And I should see "Your new Username is"
    