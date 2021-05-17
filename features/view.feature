Feature: Role view

  Background:
    Given There are quizzes in the database
    And I am logged into an user with the 'view' role

  Scenario: Viewing existing messages
    When  I click on 'Home'
    Then  I see the existing quizzes

  Scenario: Showing the quiz
    # issue here \/
    When  I click on 'show'
    Then  I see the questions and answer options

  Scenario: See question’s correct answer
    When  I click on 'show'
    And   I click on 'answers'
    Then  I see the correct answers
