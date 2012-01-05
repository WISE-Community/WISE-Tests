Feature: Author a project in the Authoring Tool
  In order to author a project,
  As a teacher
  I want to be able to perform authoring in the Authoring Tool
  
  Scenario: Launch authoring tool and open a project
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    Then I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    
  Scenario: Create a project
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I see "Exit to Home" in the Authoring Tool
    And I click on the "Create Project" button in the Authoring Tool
    And I see the "createProjectDialog" popup in the Authoring Tool
    And I enter "Test Project" into the "projectInput" field in the Authoring Tool
    And I click on the "Submit" button in the Authoring Tool
    Then I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I should see "Test Project" in the "projectTitleInput" field in the Authoring Tool
    
  Scenario: Copy a project
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I see "Exit to Home" in the Authoring Tool
    And I click on the "Copy Project" button in the Authoring Tool
    And I see the "copyProjectDialog" popup in the Authoring Tool
    And I select the element "last" in group name "copyProjectOption" in the "copyProjectSelect" select box in the Authoring Tool
    And I click on the "Copy" button in the Authoring Tool
    Then I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    
  Scenario: Add an activity to a project
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    And I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I click on the "Add Activity" button in the Authoring Tool
    And I see the "createSequenceDialog" popup in the Authoring Tool
    And I enter a unique value starting with "Activity Test" into the "createSequenceInput" field in the Authoring Tool
    And I click on the "Submit" button in the Authoring Tool
    And I click on the master node in the Authoring Tool
    Then I should see the new activity as the first activity in the Authoring Tool

  Scenario: Add a second activity to a project
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    And I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I click on the "Add Activity" button in the Authoring Tool
    And I see the "createSequenceDialog" popup in the Authoring Tool
    And I enter a unique value starting with "Activity Test" into the "createSequenceInput" field in the Authoring Tool
    And I click on the "Submit" button in the Authoring Tool
    And I click on the master node in the Authoring Tool
    Then I should see the new activity as the first activity in the Authoring Tool
  
  Scenario: Add a step to a project
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    And I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I click on the "Add Step" button in the Authoring Tool
    And I see the "createNodeDialog" popup in the Authoring Tool
    And I enter a unique value starting with "Step Test" into the "createNodeTitle" field in the Authoring Tool
    And I select the element "Open Response" in group name "selectStepTypeOption" in the "createNodeType" select box in the Authoring Tool
    And I click on the "Submit" button in the Authoring Tool
    And I click on the first activity in the Authoring Tool
    Then I should see the new step in the first activity in the Authoring Tool
    
  Scenario: Add a second step to a project
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    And I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I click on the "Add Step" button in the Authoring Tool
    And I see the "createNodeDialog" popup in the Authoring Tool
    And I enter a unique value starting with "Step Test" into the "createNodeTitle" field in the Authoring Tool
    And I select the element "Open Response" in group name "selectStepTypeOption" in the "createNodeType" select box in the Authoring Tool
    And I click on the "Submit" button in the Authoring Tool
    And I click on the first activity in the Authoring Tool
    Then I should see the new step in the first activity in the Authoring Tool
    
  Scenario: Move a step in a project
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    And I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I select the first step in the Authoring Tool
    And I click on the "Move" button in the Authoring Tool
    And I click on the second step in the Authoring Tool
    Then I should see the step as the second step in the Authoring Tool

  Scenario: Move an activity in a project
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    And I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I select the first activity in the Authoring Tool
    And I click on the "Move" button in the Authoring Tool
    And I click on the second activity in the Authoring Tool
    Then I should see the activity as the second activity in the Authoring Tool


  Scenario: Duplicate a step in a project
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    And I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I select the first step in the Authoring Tool
    And I click on the "Duplicate" button in the Authoring Tool
    Then I should see the number of steps increase in the Authoring Tool
    
  Scenario: Duplicate an activity in a project
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    And I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I select the first activity in the Authoring Tool
    And I click on the "Duplicate" button in the Authoring Tool
    Then I should see the number of activities increase in the Authoring Tool
    
  Scenario: Delete a step in a project
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    And I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I select the first step in the Authoring Tool
    And I click on the "Delete" button in the Authoring Tool
    Then I should see the number of steps decrease in the Authoring Tool

  Scenario: Delete an activity in a project
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    And I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I select the first activity in the Authoring Tool
    And I click on the "Delete" button in the Authoring Tool
    Then I should see the number of activities decrease in the Authoring Tool
    
  Scenario: Edit a step in a project and make sure it saves
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    And I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I click edit on the first step in the Authoring Tool
    And I see the "authorStepDialog" popup in the Authoring Tool
    And I enter a unique value starting with "Hello" into the "promptInput" field in the Authoring Tool
    And I click on the "Save & Close" button in the Authoring Tool
    And I should not see the "authorStepDialog" popup in the Authoring Tool
    And I click edit on the first step in the Authoring Tool
    Then I should see the previously saved content in the "promptInput" field in the Authoring Tool
    
  Scenario: Edit a step in a project and make sure the preview frame updates
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    And I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I click edit on the first step in the Authoring Tool
    And I see the "authorStepDialog" popup in the Authoring Tool
    And I enter a unique value starting with "Hello" into the "promptInput" field in the Authoring Tool
    And I click on the "Save & Close" button in the Authoring Tool
    And I should not see the "authorStepDialog" popup in the Authoring Tool
    And I click edit on the first step in the Authoring Tool
    Then I should see the previously saved content in the preview frame in the Authoring Tool
    
  Scenario: Preview a project in the Authoring Tool
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    And I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I click on the "Preview Project" button in the Authoring Tool
    Then I should see the preview window open
    
  Scenario: Exit to Home in the Authoring Tool
    Given I am logged in as teacher2
    When I click on the "Management" link
    And I click on the "Launch Authoring Tool" link
    And I click on the "Open Project" button in the Authoring Tool
    And I select the element "last" in group name "projectOption" in the "selectProject" select box in the Authoring Tool
    And I should see "Project Title" in the Authoring Tool
    And I should see "ID" in the Authoring Tool
    And I click on the "Exit to Home" button in the Authoring Tool
    Then I should see "Teacher Home"