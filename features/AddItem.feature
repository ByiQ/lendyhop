Feature: User can manually an Item to the listing
  
Background: database is full and user is logged in
  Given the following users exist:
  | user_name | firstname | lastname | address | phone | id |
  | JStev     | J         | Stev     | Waldo   | 0     | 1  |
  Given the following items exist:
  | title  | description | condition | location | status | price | user_id |
  | Shovel | Shovel      | Good      | Here     | Rusty  | 0     | 1       |
  And I am on the LendyHop home page
  When I follow "Login"
  Then I should be on the User Login page
  When I fill in "User Name" with "JStev"
  # And I fill in "Password" with "password"
  And I press "Login"

#begin
Scenario: Add an Item
  Given I am on the Listings page
  When I follow "Create Listing"
  Then I should be on the Create new Listing page
  When I fill in "Title" with "Shovel"
  And I fill in "Description" with "This is a Shovel."
  And I fill in "Price" with "2.00"
  #Location should be given by User account
  And I fill in "Condition" with "Good"
  And I fill in "Status" with "Blade may need sharpening"
  And I press "Create Listing"
  
Scenario: View a Listing
 When I go to the Listings page
 Then I should see "Shovel"