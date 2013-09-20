Feature: Recover account
  In order to recover an account,
  Without logging in
  I want to be able to retrieve my username or reset my password
  
  Scenario: Forgot teacher password
    Given I am on the home page
    When I click on the "Forgot Username or Password?" link
    And I see "What sort of WISE account do you have?"
    And I click on the "Teacher Account" link
    And I see "Remember Your Username but Forgot Your Password?"
    And I enter "$teacherLogin1" into the "username" field
    And I click on the "Change Password" button
    Then I should see "An email has been sent to your email account"
    
  Scenario: Forgot teacher username
    Given I am on the home page
    When I click on the "Forgot Username or Password?" link
    And I see "What sort of WISE account do you have?"
    And I click on the "Teacher Account" link
    And I see "Forgot Your Username?"
    And I enter "testteacher@berkeley.edu" into the "emailAddress" field
    And I click on the "Send Username" button
    Then I should see "An email has been sent to your email account"
  
  Scenario: Forgot student password
    Given I am on the home page
    When I click on the "Forgot Username or Password?" link
    And I see "What sort of WISE account do you have?"
    And I click on the "Student Account" link
    And I see "Enter your WISE username"
    And I enter "$studentLogin1" into the "userName" field
    And I click on the "Next" button
    And I see "Please answer the password reminder question that you encountered during your initial registration"
    And I enter "a" into the "submittedAnswer" field
    And I click on the "Next" button
    And I see "That answer is correct!"
    And I enter "a" into the "newPassword" field
    And I enter "a" into the "verifyPassword" field
    And I click on the "SUBMIT" button
    Then I should see "Your password has been changed"
  
  Scenario: Forgot student username
    Given I am on the home page
    When I click on the "Forgot Username or Password?" link
    And I see "What sort of WISE account do you have?"
    And I click on the "Student Account" link
    And I see "I can't remember my Username"
    And I click on the "I can't remember my Username" link
    And I see "Run a Search for Your Username"
    And I enter "TestStuden" into the "firstName" field
    And I enter "t" into the "lastName" field
    And I click on the "Search" button
    And I see "Found matches"
    And I click on the "$studentLogin1" link
    Then I should see "Sign In"