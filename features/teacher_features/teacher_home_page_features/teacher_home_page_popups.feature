Feature: Access teacher popups
  In order to perform teacher actions such as access the run info or launch the grading tool,
  As a teacher
  I want to be able to view teacher popups
  
  Scenario: Access the run Info page
    Given I am logged in as a teacher
    When I click on the "Info" link
    Then I should see "Project Details"
    
  Scenario: Access the Authoring Tool
    Given I am logged in as a teacher
    When I click on the "Edit Content" link and say OK to the warning
    Then I should see "Exit to Home" in the Authoring Tool
    
  Scenario: Access the Edit Run Settings page
    Given I am logged in as a teacher
    When I click on the "Edit Run Settings" link
    Then in the "Edit Run Settings" iframe I should see "Enable Idea Manager"

  Scenario: Access the Researcher Tools page
    Given I am logged in as a teacher
    When I click on the "Researcher Tools" link
    Then in the "Researcher Tools" iframe I should see "Export the latest student revision"