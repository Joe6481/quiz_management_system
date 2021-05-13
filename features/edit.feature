Feature: Edit

  Background:
    Given I am logged into an user with the edit role

  Scenario: Viewing existing messages
    Given There are quizzes in the database
    When  I click on 'quizzes_path'
    Then  I see the existing quizzes

  Scenario: Showing the quiz
    Given There are quizzes in the database
    When  I click on 'show'
    Then  I see the quiz's questions
    Then  I see the quiz's questtions' answer options

  Scenario: See question’s correct answer
	  Given There are quizzes in the database
    When  I click on 'show'
    And   I click 'answers'
    Then  I see the correct answer

  Scenario: Creating a new quiz	
    When  I create a new quiz
    Then  I see the quiz

  Scenario: Edit question contents
    Given There are messages in the database
    When  I click on 'edit'
    And   I edit the question
    Then  I no longer see the old question
    Then  I see the edited question

  Scenario: Add a new question when creating a quiz
    Given The quiz form has 3 question fields
    When  I click 'add question'
    Then  I see another question field

  Scenario: Add a new question when editing a quiz
    Given There are messages in the database
    When  I click 'edit'
    And   I click 'add question'
    Then  I see another question field

  Scenario: Remove a question when creating a quiz
    Given The form has a question field filled
    When  I click 'remove question'
    And   I click 'submit'
    Then  I do not see the question

  Scenario: Remove a question when editing a quiz
    Given There are messages in the database
    When  I click 'edit'
    And   I click 'remove question'
    And   I click 'submit'
    Then  I no longer see the question

  Scenario: Edit answer contents
    Given There are messages in the database
    When  I click 'edit'
    And   I edit the answer
    Then  I no longer see the old answer
    Then  I see the edited answer

  Scenario: Add a new answer field when creating a quiz
    Given The question form has 4 answer fields
    When  I click 'add answer'
    Then  I see another answer field

  Scenario: Add a new answer field when editing a quiz
    Given There are messages in the database
    When  I click 'add answer'
    And   I click 'add question'
    Then  I see another answer field

  Scenario: Limit number of answer fields to max 5
    Given The question form has 5 answer fields
    And   I click 'add answer'
    Then  I see 5 answer fields

# May not need these below
  Scenario: Remove an answer when creating a quiz
    Given The form has 4 answer fields
    When  I click 'remove answer'
    Then  I see 3 answer fields

  Scenario: Remove an answer when editing a quiz
    Given There are messages in the database
    When I click 'edit'
    When I click 'remove answer'
    Then I see 3 answer fields

  Scenario: Limit number of answer fields to min 3
    Given The question form has 3 answer fields
    And I click 'remove answer'
    Then I see 3 answer fields
