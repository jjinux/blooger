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
    And I should not see "Welcome, joe"

    When I login on the current page
    Then I should see "Welcome, joe"
    And I should see "Logout"
    And I should see the page header "Posts"

  Scenario: log out
    Given I am logged in
    Then I should not see "Log In"
    And I should not see "Register"
    And I should see "Account"
    And I should see "Logout"

    When I follow "Logout"
    Then I should see "Log In"
    And I should see "Register"
    And I should see "You are now logged out."
    And I should not see "Account"
    And I should not see "Logout"