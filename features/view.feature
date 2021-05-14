Feature: Role view

  Background:
    Given I am logged into an user with the 'view' role

  Scenario: Viewing existing messages
    Given There are quizzes in the database
    When  I click on 'Home'
    Then  I see the existing quizzes

  Scenario: Showing the quiz
    Given There are quizzes in the database
    # issue here \/
    When  I click on 'show'
    Then  I see the questions
    Then  I see the answer options

  Scenario: See question’s correct answer
	  Given There are quizzes in the database
    When  I click on 'show'
    And   I click on 'answers'
    Then  I see the correct answers
