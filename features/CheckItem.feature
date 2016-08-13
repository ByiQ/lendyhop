Feature: User can checkout and checkin an item
  
Background: shovel is in database
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

Scenario: Checkout then In an Item
  Given I am on the Listings page
  And I should see "Shovel"
  When I follow "Shovel"
  Then I should see "Check Out"
  When I follow "Check Out"
  Then I am on the Checkout Item page
  And I check "mm"
  And I press "Checkout"
  Then I should see "Check In"
  And I follow "Check In"
  Then I should see "Check Out"