Feature: Edits and Deletes a listing

Scenario: Edit a listing
  Given I am on Edit Item page for "Shovel"
  When I fill in "Name" with "Joe Stevens"
  And I fill in "Address" with "1234 Address Circle 12345"
  And I fill in "Condition" with "Average"
  And I press "Save Changes"
  
Scenario: Delete a listing
  Given I am on Edit Item page for "Shovel"
  When I press "Delete Item"
  Then  I should be on the Listings page
  And I should not see "Shovel"