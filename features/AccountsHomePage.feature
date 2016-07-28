Feature: New Users have to register for an account

Scenario: Create a new User
  Given I am on the LendyHop home page
  When I follow "Create an Account"
  Then I should be on the Create New Account page
  When I fill in "Name" with "Joe Stevens"
  And I fill in "Address" with "1234 Address Square 12345"
  And I fill in "Phone Number" with "4021234567"
  And I fill in "Email" with "example@gmail.com"
  And I fill in "UserName" with "JStev"
  And I fill in "Password" with "password"
  And I press "Save Changes"
  
Scenario: Logging In
  Given I am on hte LendyHop home page
  When I follow "Login"
  Then I should be on the Login to Account page
  When I fill in "Username" with "JStev"
  And I fill in "Password" with "password"
  And I press "Login"