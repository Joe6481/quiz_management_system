Feature: Role: edit

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

  Scenario: See question’s correct answer
    When  I click on 'Show'
    And   I click on 'Reveal Answers'
    Then  I see the correct answers

  Scenario: Creating a new quiz	
    When  I create a new quiz
    Then  I see the quiz

  Scenario: Edit question contents
    When  I click on 'Edit'
    And   I edit the question contents
    Then  I no longer see the old question
    Then  I see the edited question

  Scenario: Edit answer contents
    When  I click on 'Edit'
    And   I edit the answer
    Then  I no longer see the old answer
    Then  I see the edited answer
