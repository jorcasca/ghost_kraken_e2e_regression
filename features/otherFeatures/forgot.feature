Feature: Forgot

@user1 @web
Scenario: Forgot failed with non-existent user
    Given I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    When I fill login with "emailNonExistent@email.com" and "p4ssw0rd.."
    And I try to remember password
    Then I expect to see in signin "User not found."

@user2 @web
Scenario: Forgot failed without email
    Given I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    When I fill login with "" and ""
    And I try to remember password
    Then I expect to see in signin "We need your email address to reset your password!"

@user3 @web
Scenario: Forgot failed with invalid email format
    Given I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    When I fill login with "emailNonExistent" and ""
    And I try to remember password
    Then I expect to see in signin "We need your email address to reset your password!"

@user4 @web
Scenario: Forgot failed with non-existent user many times
    Given I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    When I fill login with "emailNonExistent@email.com" and ""
    And I try to remember password
    And I try to remember password
    And I try to remember password
    And I try to remember password
    And I try to remember password
    Then I expect to see in signin "Too many attempts try again in an hour"
