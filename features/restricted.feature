Feature: Role: restricted

Background:
    Given There are quizzes in the database
    And I am logged into an user with the 'edit' role

  Scenario: Viewing existing messages
    When  I click on 'Home'
    Then  I see the existing quizzes
    And I see a welcome message

  Scenario: Showing the quiz
    When  I click on 'Show'
    Then  I see the quiz contents, questions and answer options
    
