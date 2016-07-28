Feature: Searches for an Item

Scenario: Search bar
  Given I am on Listings page
  When I fill in "Search" with "Shovel"
  Then I should be on the Listings page for "Shovel"
  And I should see "Shovel"
  
#Scenario: Tags should add another scenario to test tags