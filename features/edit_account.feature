Feature: Edit accounts email/password

Scenario: Edit email
  Given the site is set up
  And I login with "master" and "Password"
	And I am on the edit account page
	When I fill in "email_address" with "test@yahoo.com"
	And I press "Update"
	Then I should be on the edit account page
	And I should see "Email changed!"

Scenario: Change password (Happy Path)
  Given the site is set up
  And I login with "master" and "Password"
	And I am on the edit account page
	When I fill in "password_current" with "Password"
	And I fill in "password_new_new" with "Foobarzz"
	And I fill in "reenter_pass" with "Foobarzz"
	And I press "Change Password"
	Then I should be on the edit account page
	And I should see "Password changed"

Scenario: Change password (sad path)
  Given the site is set up
  And I login with "master" and "Password"
	And I am on the edit account page
  When I fill in "password_current" with "foobar"
  And I fill in "password_new_new" with "Foobarzz"
  And I fill in "reenter_pass" with "Foobarzz"
  And I press "Change Password"
  Then I should be on the edit account page
  And I should see "Password incorrect"

Scenario: Change password (sad path 2)
  Given the site is set up
  And I login with "master" and "Password"
	And I am on the edit account page
	When I fill in "password_current" with "Password"
	And I fill in "password_new_new" with "Foobarzz"
	And I fill in "reenter_pass" with "LEEEajsjsjs"
	And I press "Change Password"
	Then I should be on the edit account page
	And I should see "The new password you entered doesn't match"

Scenario: Change password (sad path 3)
  Given the site is set up
  And I login with "master" and "Password"
	And I am on the edit account page
	And I fill in "password_current" with "Password"
	And I fill in "password_new_new" with "Foobarzz"
	And I fill in "reenter_pass" with "LEEEajsjsjs"
	And I press "Change Password"
	Then I should be on the edit account page
	And I should see "The new password you entered doesn't match"

Scenario: Change Location (Happy Path)
	Given the site is set up
	And I login with "master" and "Password"
	And I am on the edit account page
	And I fill in "location_name" with "SF"
	And I press "Change Location"
	Then I should be on the edit account page
	And I should see "Location changed"

Scenario: Change Phone Number (Happy Path)
	Given the site is set up
	And I login with "master" and "Password"
	And I am on the edit account page
	And I fill in "phone_number" with "4839458403"
	And I press "Change Phone"
	Then I should be on the edit account page
	And I should see "Phone number changed"

Scenario: Edit Skills (Happy Path - Admin user)
  Given the site is set up
  And I login with "master" and "Password"
	And I add the "water" skill to the database
	And I am on the edit account page
	And I check "water"
  And I press "Change Skills"
  Then I should be on the edit account page
  And I should see "Skills updated"

Scenario: Edit Skills (Happy Path - Regular user)
  Given the site is set up
  And I login with "master" and "Password"
	And I add the "water" skill to the database
	And I log out
	Given the account is set up
	And I am logged in as a user
	And I am on the edit account page
	And I check "water"
  And I press "Change Skills"
  Then I should be on the edit account page
  And I should see "Skills to be verified"

Scenario: Add Skills
	Given the site is set up
	And I login with "master" and "Password"
	And I add the "water" skill to the database
	And I add the "electricity" skill to the database
	And I am on the edit account page
        And I check "water"
	And I press "Change Skills"
	Then I should be on the edit account page
	And I should not see "water"
	And I should see "Electricity"
	
