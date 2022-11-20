Feature: Dashboard

@user1 @web
Scenario: Log in to dashboard
    Given I navigate to page "http://localhost:2368/ghost/#/setup"
    And I wait for 5 seconds
    When I fill register with "title" and "name" and "email@email.com" and "p4ssw0rd.."
    And I try to create account
    And I wait for 5 seconds
    And I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    When I fill login with "email@email.com" and "p4ssw0rd.."
    And I try to login
    And I wait for 5 seconds
    Then I expect to be logged in case "1"

@user2 @web
Scenario: Log out of dashboard
    Given I navigate to page "http://localhost:2368/ghost/#/setup"
    And I wait for 5 seconds
    When I fill register with "title" and "name" and "email@email.com" and "p4ssw0rd.."
    And I try to create account
    And I wait for 5 seconds
    And I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    When I fill login with "email@email.com" and "p4ssw0rd.."
    And I try to login
    And I wait for 5 seconds
    And I try to logout
    And I wait for 2 seconds
    Then I expect to be logged out in case "2"
