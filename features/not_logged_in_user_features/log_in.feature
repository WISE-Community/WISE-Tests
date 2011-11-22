Feature: Log in as all the different user types

  Scenario: Log in as a student
  Given I am on the home page
  When I log in as a student
  Then I should see "Student Home"
  
  Scenario: Log in as a teacher
  Given I am on the home page
  When I log in as a teacher
  Then I should see "Teacher Home"
  
  Scenario: Log in as an admin
  Given I am on the home page
  When I log in as an admin
  Then I should see "WISE Administrator Tools"