Feature: User Sessions
  So that I can have my own blog
  As a non-user
  I want to sign up and create a blog

  Scenario: log in
    Given I am a registered user
    And I am on the homepage

    When I follow "Log In"
    And I try to login with a blank password on the current page
    Then I should see "Password cannot be blank"
    And I should not see "Login successful!"

    When I login on the current page
    Then I should see "Login successful!"
    And I should see "Logout"

  Scenario: log out
    Given I am logged in
    When I follow "Logout"
    Then I should see "You are now logged out."
    And I should see "Username"