Feature: Role: edit

  Background:
    Given I am logged into an user with the 'edit' role

  Scenario: Viewing existing messages
    Given There are quizzes in the database
    When  I click on 'Home'
    Then  I see the existing quizzes

  Scenario: Showing the quiz
    Given There are quizzes in the database
    # issue here \/
    When  I click on show
    Then  I see the questions
    Then  I see the answer options

  Scenario: See question’s correct answer
	  Given There are quizzes in the database
    When  I click on 'show'
    And   I click on 'answers'
    Then  I see the correct answers

  Scenario: Creating a new quiz	
    When  I create a new quiz
    Then  I see the quiz

  Scenario: Edit question contents
    Given There are quizzes in the database
    When  I click on 'edit'
    And   I edit the question contents
    Then  I no longer see the old question
    Then  I see the edited question

  Scenario: Add a new question field
    # count number of fields ???
    Given The quiz form has 3 question fields
    When  I click on 'Add Question'
    Then  I see another question field

  Scenario: Limit number of answer fields to max 5
    Given The question form has 5 answer fields
    And   I click on 'add answer'
    Then  I see 5 answer fields

  Scenario: Remove a question field
    Given The quiz form has 3 question fields
    When  I click on 'Remove question'
    Then  I see 2 answer fields

  Scenario: Edit answer contents
    Given There are quizzes in the database
    When  I click on 'edit'
    And   I edit the answer
    Then  I no longer see the old answer
    Then  I see the edited answer

  Scenario: Add a new answer field
    Given The question form has 4 answer fields
    When  I click on 'add answer'
    Then  I see another answer field
