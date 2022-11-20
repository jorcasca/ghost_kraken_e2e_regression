Feature: Log in

@user1 @web
Scenario: Login failed without email and password
    Given I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    When I fill login with "" and ""
    And I try to login
    Then I expect to see in signin "Please fill out the form to sign in."

@user2 @web
Scenario: Login failed without email
    Given I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    When I fill login with "" and "p4ssw0rd.."
    And I try to login
    Then I expect to see in signin "Please fill out the form to sign in."

@user3 @web
Scenario: Login failed without password
    Given I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    When I fill login with "email@email.com" and ""
    And I try to login
    Then I expect to see in signin "Please fill out the form to sign in."

@user4 @web
Scenario: Login failed with invalid email format
    Given I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    When I fill login with "email" and "p4ssw0rd.."
    And I try to login
    Then I expect to see in signin "Please fill out the form to sign in."

@user5 @web
Scenario: Login failed with non-existent user
    Given I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    When I fill login with "emailNonExistent@email.com" and "p4ssw0rd.."
    And I try to login
    Then I expect to see in signin "There is no user with that email address."
