Feature: Searches for an Item

Background: shovel is in database
  Given the following users exist:
  | user_name | firstname | lastname | address | phone | id |
  | JStev     | J         | Stev     | Waldo   | 0     | 1  |
  Given the following items exist:
  | title  | description | condition | location | status | price | user_id |
  | Shovel | Shovel      | Good      | Here     | Rusty  | 0     | 1       |

Scenario: Search bar
  Given I am on the Listings page
  When I fill in "Enter Search Terms" with "Shovel"
  And I press "Search"
  Then I should be on the Search Results page
  And I should see "Shovel"
  
#Scenario: Tags should add another scenario to test tags