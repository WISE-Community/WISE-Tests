Feature: Create Teacher Account

  Scenario: Go to Teacher Registration page
    Given I am on the home page
    When I click on the "Create WISE Account" link
    Then I should see "New Account Registration"
    When I click on the "Teacher Account" link
    Then I should see "Teacher Registration"    
    
  Scenario: Fill in all required information correctly
    Given I am on the Teacher Registration page
    And I have entered "Test" into the "teacherFirstName" field
    And I have entered "Teacher" into the "teacherLastName" field
    And I have entered "testteacher@berkeley.edu" into the "teacherEmail" field
    And I have entered "Test City" into the "teacherCity" field
    And I have entered "Test State" into the "teacherState" field
    And I have entered "Test Country" into the "teacherCountry" field
    And I have entered "Test School" into the "teacherSchool" field  
    And I choose "ELEMENTARY_SCHOOL" from the "schoollevel" dropdown
	And I click on the "legalAcknowledged" checkbox    
    And I have entered "a" into the "password" field
    And I have entered "a" into the "repeatedPassword" field
    And I have entered "Test" into the "howDidYouHearAboutUs" field
    When I click on the "Create Account" link
    And if I see "Account Already Exists" then I click on "Create New Account"
    And if I see a popup then I click OK
    Then I should see "Account Created!"
    And I should see "Your new Username is"
    