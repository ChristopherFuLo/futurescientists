Feature: Admin can make an admin account
    As an Admin,
    So that I can moderate the site,
    I want to be able to create an administrative account

Background:
    Given the site is set up
    And I add the "water" skill to the database
    And I add the "electronics" skill to the database
    And I go to the create account page
    And I fill in the following fields:
        | Email         | Account Name | Password | Name | Phone Number | Location |
        | test@test.com | Tester       | Password | Test | 1234567890   | Panama   |
    And I check "water"
    And I check "electronics"
    And I press "Create Account"
    Then I should be on the problems page
    And I login with "Tester" and "Password"
    Given "Test" created the following problems:
        | location | skills          | summary           | description       | wage |
        | Address1 | water           | broken water pipe | water pipe broken | 50   |
    And I log out
    And I am logged in as an admin
    And I am on the create account page
    And I should see "Admin"

Scenario: Happy Path - Admin successfully creates an account
    Given I fill in the following fields:
        | Email           | Account Name | Password | Name  | Phone Number | Location |
        | admin@admin.com | admin        | Password | Admin | 9994441111   | US       |
    And I check "Admin"
    And I press "Create Account"
    Then I should be on the problems page
    When I go to the profile page
    Then I should see "Admin"
