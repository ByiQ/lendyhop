Feature: User can manually an Item to the listing

Scenario: Add an Item
  Given I am on the Listings page
  When I follow "Add new Item"
  Then I should be on the Create new Listing page
  When I fill in "Title" with "Shovel"
  And I fill in "Description" with "This is a Shovel."
  And I fill in "Price" with "2.00"
  #Location should be given by User account
  And I fill in "Condition" with "Good"
  And I press "Save Changes"
  
Scenario: find movie with same director
 When I go to the Listing page
 Then  I should see "Shovel"