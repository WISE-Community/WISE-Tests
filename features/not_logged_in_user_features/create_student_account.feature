Feature: Create Student Account

  Scenario: Go to Student Registration page
    Given I am on the home page
    When I click on the "Create WISE Account" link
    Then I should see "New Account Registration"
    When I click on the "Student Account" link
    Then I should see "Student Registration"    
    
  Scenario: Fill in all required information correctly
    Given I am on the Student Registration page
    And I have entered "TestStuden" into the "firstname" field
    And I have entered "t" into the "lastname" field
    And I choose "MALE" from the "gender" dropdown
    And I choose "1" from the "birthmonth" dropdown
    And I choose "1" from the "birthdate" dropdown
    And I have entered "a" into the "password" field
    And I have entered "a" into the "repeatedPassword" field
    And I choose "QUESTION_ONE" from the "accountQuestion" dropdown
    And I have entered "a" into the "accountAnswer" field
    And I have entered "Cobra853" into the "runCode_part1" field
    #And I click on the "Show Class Periods" link
    And I wait "2" seconds
    And I choose "1" from the "runCode_part2" dropdown    
    When I click on the "Create Account" link
    And if I see "Account Already Exists" then I click on "Create New Account"
    And if I see a popup then I click OK
    Then I should see "Account Created!"
    And I should see "Your new Username is"
    