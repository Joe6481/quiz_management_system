Feature: Role view

  Background:
    Given There are quizzes in the database
    And I am logged into an user with the 'view' role

  Scenario: Viewing existing messages
    When  I click on 'Home'
    Then  I see the existing quizzes
    And I see a welcome message

  Scenario: Showing the quiz
    When  I click on 'Show'
    Then  I see the quiz contents, questions and answer options

  Scenario: See question’s correct answer
    When  I click on 'Show'
    And   I click on 'Reveal Answers'
    Then  I see the correct answers
