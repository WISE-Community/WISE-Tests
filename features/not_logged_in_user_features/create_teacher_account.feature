Feature: Create Teacher Account

  Scenario: Go to Teacher Registration page
    Given I am on the home page
    When I click on the "Create WISE Account" link
    Then I should see "New Account Registration"
    When I click on the "Teacher Account" link
    Then I should see "Teacher Registration"    
    
  Scenario: Fill in all required information correctly
    Given I am on the Teacher Registration page
    And I have entered "a" into the "teacherFirstName" field
    And I have entered "a" into the "teacherLastName" field
    And I have entered "a@a.com" into the "teacherEmail" field
    And I have entered "a" into the "teacherCity" field
    And I have entered "a" into the "teacherState" field
    And I have entered "a" into the "teacherCountry" field
    And I have entered "a" into the "teacherSchool" field  
    And I choose "Elementary School" from the "schoollevel" dropdown
	And I click on the "legalAcknowledged" checkbox    
    And I have entered "a" into the "password" field
    And I have entered "a" into the "repeatedPassword" field
    And I have entered "a" into the "howDidYouHearAboutUs" field
    When I click on the "Create Account" link
    And if I see "Account Already Exists" then I click on "Create New Account"
    Then I should see "Account Created!"
    And I should see "Your new Username is"
    