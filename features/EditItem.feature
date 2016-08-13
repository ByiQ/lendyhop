Feature: Edits and Deletes a listing
  
Background: database is full and user is logged in
  Given the following users exist:
  | user_name | firstname | lastname | address | phone | id |
  | JStev     | J         | Stev     | Waldo   | 0     | 5  |
  Given the following items exist:
  | title  | description | condition | location | status | price | user_id | id |
  | Shovel | Shovel      | Good      | Here     | Rusty  | 0     | 5       | 5  |
  And I am on the LendyHop home page
  When I follow "Login"
  Then I should be on the User Login page
  When I fill in "User Name" with "JStev"
  # And I fill in "Password" with "password"
  And I press "Login"
  
Scenario: Edit a listing
  Given I am on the Listings page
  When I follow "Shovel"
  Then I follow "Edit"
  Then I am on the Edit Item page
  And I fill in "Condition" with "Okay"
  And I press "Update Listing"
  
Scenario: Delete a listing
  Given I am on the Listings page
  When I follow "Shovel"
  Then I follow "Edit"
  Then I am on the Edit Item page
  And I press "Delete"