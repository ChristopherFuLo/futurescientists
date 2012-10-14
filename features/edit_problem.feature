Feature: allow problems to be edited or deleted by the poster

 As a Requester,
 So that I can keep providers updated,
 I want to be able to edit or delete my post.

Background: problems have been created by some requester

  Given the following problems exists:
  | name | location | skills relevant | problem summary   | description       |
  | Bob  | Address1 | water           | broken water pipe | water pipe broken |
  | John | Address2 | water           | broken water pipe |                   |
  | Bob  | Address1 | electricity     | wire broken       | wire broken       |
  | Bob  | Address3 | water, mold     | roof is leaking   | roof is leaking   |

  And I am logged in as Bob
  And I am on the FutureScientists home page
  
Scenario: successfully edit a problem that was created by the poster
  When I click on the 'broken water pipe' problem by 'Bob' at 'Address1'
  And I press 'edit'
  And I change 'water' to 'water, mold' in the 'skills relevant' field
  And I change 'water pipe broken' to 'water pipe broken and is causing mold' in the 'description' field
  And I press 'submit'
  Then I should see 'water, mold'
  And I should see 'water pipe broken and is causing mold'

Scenario: should be prompted to confirm to delete the problem when delete is pressed on a problem that was created by the poster
  When I click on the 'broken water pipe' problem by 'Bob' at 'Address1'
  And I press 'delete'
  Then I should see 'are you sure you want to delete this problem?'
  And I should see 'yes'
  And I should see 'no'

Scenario: should be prompted to confirm to delete the problem when delete is pressed on a problem that was created by the poster
  When I click on the 'broken water pipe' problem by 'Bob' at 'Address1'
  And I press 'delete'
  And I click on 'yes'
  Then I should not see the 'broken water pipe' problem at 'Address1'

Scenario: Only the poster of the problem may edit or delete that problem
  When I click on the 'broken water pipe' problem by 'John' at 'Address2'
  Then I should not see 'edit'
  And I should not see 'delete'