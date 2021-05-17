Feature: Role: restricted

Background:
    Given There are quizzes in the database
    And I am logged into an user with the 'edit' role

  Scenario: Viewing existing messages
    When  I click on 'Home'
    Then  I see the existing quizzes

  Scenario: Showing the quiz
    # issue here \/
    When  I click on 'show'
    Then  I see the questions and answer options
    
