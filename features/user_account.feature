Feature: User should have a user dashboard
  As a User,
  So that I can see my account status,
  I should be able to see whether I am a user or not.

Background:
    Given the site is set up
    And I add the "water" skill to the database
    Given I am on the problem submission page
	  And I select "water" from "skills"
	  And I fill in "Problem Summary" with "Broken Pipe"
	  And I press "Submit Problem"
    And I log out
    
    Given I add the "water" skill to the database
		Given I add the "electronics" skill to the database
    And I am on the create account page
    And I fill in the following fields:
        |Email          | Account Name | Password | Name | Phone Number | Location |
        | test@test.com | Tester       | Password | Test | 1234567890   | Panama   |
    And I press "Create Account"
    And I log out
    And I login with "Tester" and "Password"

Scenario: Checking account status as User
	Given I go to the profile page
	Then I should see "User"
	And I should not see "Admin"