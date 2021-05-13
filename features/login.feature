Feature: Login

  Scenario: Logging into an existing user with valid credentials
    Given I am not logged in
    When I log into an existing user
    Then I see that I am logged in

  Scenario: Logging in with invalid credentials
    Given I am not logged in
    When I log in with invalid credentials
    Then I see that my login failed

  Scenario: Logging out
    Given I log into an existing user
    When I logout
    Then I see that I am logged out
