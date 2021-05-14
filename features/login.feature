Feature: Login

  Scenario: Logging into an existing user with valid credentials
    Given I am not logged in
    When  I log into an existing user
    Then  I see that I am logged in

  Scenario: Logging in with invalid credentials
    Given I am not logged in
    When  I log in with invalid credentials
    Then  I see that I am logged out

  Scenario: Logging out
    Given I am not logged in
    When  I log into an existing user
    And   I log out
    Then  I see that I am logged out
