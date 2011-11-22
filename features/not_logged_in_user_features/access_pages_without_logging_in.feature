Feature: Access pages that do not require logging in

  Scenario: Go to the Home page
  Given I am on the home page
  Then I should see "Welcome! New to WISE? Sign up for free."
  
  Scenario: Go to the Browse WISE Curricula page
  Given I am on the home page
  When I click on the "Browse WISE Curricula" link
  Then I should see "Preview WISE Projects"
  
  Scenario: Go to the Create WISE Account page
  Given I am on the home page
  When I click on the "Create WISE Account" link
  Then I should see "New Account Registration"  
  
  Scenario: Go to the Forgot Username or Password page
  Given I am on the home page
  When I click on the "Forgot Username or Password?" link
  Then I should see "Lost Username or Password"
  