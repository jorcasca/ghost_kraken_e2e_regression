Feature: Forgot

@user1 @web
Scenario: Forgot failed with non-existent user
    Given I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    When I fill login with "emailNonExistent@email.com" and "p4ssw0rd.."
    And I try to remember password
    Then I expect to see in forgot "User not found." in case "1"

@user2 @web
Scenario: Forgot failed without email
    Given I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    When I fill login with "" and ""
    And I try to remember password
    Then I expect to see in forgot "We need your email address to reset your password!" in case "2"

@user3 @web
Scenario: Forgot failed with invalid email format
    Given I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    When I fill login with "emailNonExistent" and ""
    And I try to remember password
    Then I expect to see in forgot "We need your email address to reset your password!" in case "3"

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
    Then I expect to see in forgot "Too many attempts try again in an hour" in case "4"
