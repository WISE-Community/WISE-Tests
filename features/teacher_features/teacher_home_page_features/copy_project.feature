Feature: Copy project
  In order to copy a project,
  As a teacher
  I want to be able to find a project and copy it
  
  Scenario: Copy a project
    Given I am logged in as a teacher
    And I click on the "Management" link
    When I click on the "Browse WISE Projects" link
    And I click on the "Owned (My Custom Projects)" link
    And I count the number of projects with the title "Airbags: Too Fast, Too Furious?"
    And I click on the "Management" link
    And I click on the "Browse WISE Projects" link
    And I click on the "Copy (Customize)" link
    And I click on the "OK" button
    And I see "Successfully copied"
    And I click on the "OK" button
    And I click on the "Owned (My Custom Projects)" link
    Then I should see the number of projects with the title "Airbags: Too Fast, Too Furious?" increase
