Feature: User can manually add user

Scenario: Add a user
  Given I am on the LendyHop home page
  When I follow "Add new user"
  Then I should be on the Create New User page
  When I fill in "User Name" with "JDoe"
  When I fill in "First Name" with "John"
  When I fill in "Last Name" with "JDoe"
  When I fill in "Address" with "000 Waldo St"
  When I fill in "Phone" with "6666"
  And I press "Create User"