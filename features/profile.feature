Feature: Profile

@user1 @web
Scenario: Go to profile
    Given I navigate to page "http://localhost:2368/ghost/#/setup"
    And I wait for 5 seconds
    When I fill register with "title" and "name" and "email@email.com" and "p4ssw0rd.."
    And I try to create account
    And I wait for 5 seconds
    And I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    And I fill login with "email@email.com" and "p4ssw0rd.."
    And I try to login
    And I wait for 5 seconds
    And I try to go to profile
    Then I expect to be in my profile in case "1"

@user2 @web
Scenario: Edit full name in profile
    Given I navigate to page "http://localhost:2368/ghost/#/setup"
    And I wait for 5 seconds
    When I fill register with "title" and "name" and "email@email.com" and "p4ssw0rd.."
    And I try to create account
    And I wait for 5 seconds
    And I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    And I fill login with "email@email.com" and "p4ssw0rd.."
    And I try to login
    And I wait for 5 seconds
    And I try to go to profile
    And I wait for 5 seconds
    And I try to set fullname to "new-name"
    And I save changes
    Then I expect "new-name" is my fullname profile in case "2"

@user3 @web
Scenario: Edit slug in profile
    Given I navigate to page "http://localhost:2368/ghost/#/setup"
    And I wait for 5 seconds
    When I fill register with "title" and "name" and "email@email.com" and "p4ssw0rd.."
    And I try to create account
    And I wait for 5 seconds
    And I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    And I fill login with "email@email.com" and "p4ssw0rd.."
    And I try to login
    And I wait for 5 seconds
    And I try to go to profile
    And I wait for 5 seconds
    And I try to set slug to "new-slug"
    And I save changes
    Then I expect "new-slug" is my slug profile in case "3"

@user4 @web
Scenario: Edit location in profile
    Given I navigate to page "http://localhost:2368/ghost/#/setup"
    And I wait for 5 seconds
    When I fill register with "title" and "name" and "email@email.com" and "p4ssw0rd.."
    And I try to create account
    And I wait for 5 seconds
    And I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    And I fill login with "email@email.com" and "p4ssw0rd.."
    And I try to login
    And I wait for 5 seconds
    And I try to go to profile
    And I wait for 5 seconds
    And I try to set location to "new-location"
    And I save changes
    Then I expect "new-location" is my location profile in case "4"

@user5 @web
Scenario: Edit Bio in profile
    Given I navigate to page "http://localhost:2368/ghost/#/setup"
    And I wait for 5 seconds
    When I fill register with "title" and "name" and "email@email.com" and "p4ssw0rd.."
    And I try to create account
    And I wait for 5 seconds
    And I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 5 seconds
    And I fill login with "email@email.com" and "p4ssw0rd.."
    And I try to login
    And I wait for 5 seconds
    And I try to go to profile
    And I wait for 5 seconds
    And I try to set Bio to "new-bio"
    And I save changes
    Then I expect "new-bio" is my Bio profile in case "5"