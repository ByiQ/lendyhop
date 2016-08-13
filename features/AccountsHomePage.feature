Feature: New Users have to register for an account

Scenario: Create a new User
  Given I am on the LendyHop home page
  When I follow "New user"
  Then I should be on the Create New User page
  When I fill in "First Name" with "Joe"
  And I fill in "Last Name" with "Stevens"
  And I fill in "Address" with "1234 Address Square 12345"
  And I fill in "Phone Number" with "4021234567"
  # And I fill in "Email" with "example@gmail.com"
  And I fill in "User Name" with "JStev"
  # And I fill in "Password" with "password"
  And I press "Create User"
  
Scenario: Logging In
  Given I am on the LendyHop home page
  When I follow "Login"
  Then I should be on the User Login page
  When I fill in "User Name" with "JStev"
  # And I fill in "Password" with "password"
  And I press "Login"