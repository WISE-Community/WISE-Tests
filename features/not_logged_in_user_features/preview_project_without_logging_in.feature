Feature: Preview project without logging in
  In order to preview projects,
  Without logging in
  I want to be able to preview a project from the Browse WISE Curricula page
  
  Scenario: Preview a project from the Browse WISE Curricula
    Given I am on the home page
    When I click on the "Browse WISE Curricula" link
    And I click on the "Preview" link
    Then I should see the preview window open