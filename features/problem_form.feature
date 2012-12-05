Feature: allow submission of problems

  As a Requester
  So that I can post a problem
  I want to be able to fill out and submit a problem form

Background: Go to the Problem Submission view
  Given the site is set up
  Given I am on the home page
  When I follow "Submit New Problem"
  Then I should be on the problem submission page
  Given I log out
  
Scenario: problem submission form renders correctly
  Given I am on the problem submission page
  Then I should see "Name"
  Then I should see "Phone Number"
  And I should see "Location"
  And I should see "Problem Summary"
  And I should see "Description"
  And I should see "Wage"
  
Scenario: Problem submits successfully
  Given I add the "water" skill to the database
  Given I am on the problem submission page
  When I fill in "Location" with "Sproul Plaza"
  And I fill in "Name" with "James Won"
  And I fill in "Phone Number" with "999-999-9999"
  And I select "water" from "skills"
  And I fill in "Problem Summary" with "Broken Sink"
  And I fill in "Wage" with "50"
  And I press "Submit Problem"
  And I go to the home page
  Then I should see "Broken Sink"

Scenario: Problem submission page should be prepopulated if logged in
  Given I am on the create account page
  When I fill in the following fields:
        | Email         | Account Name | Password | Name | Phone Number | Location |
        | test@test.com | Tester       | Password | Test | 1234567890   | 94704    |
  And I press "Create Account"
  And I log out
  And I login with "Tester" and "Password"
  And I go to the problem submission page
  Then the "Name" field should contain "Test"
  And the "Phone Number" field should contain "\+11234567890"
  And the "Location" field should contain "94704"

