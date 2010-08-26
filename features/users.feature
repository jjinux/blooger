Feature: Users
  So that I can write my own blog
  As an unregistered user
  I want to register as a user

  Scenario: register unsuccessfully
    Given I am on the homepage
    When I follow "Register"
    And I fill in "Username" with "              "
    And I press "Register"
    Then I should see "There were problems with the following fields:"
    And I should see "Password confirmation is too short (minimum is 4 characters)"
    And I should see "Username is too short (minimum is 3 characters)"
    And I should see "Username should use only letters, numbers, spaces, and .-_@ please."
    And I should see "Password is too short (minimum is 4 characters)"
    And I should see "Password doesn't match confirmation"
    And I should see "Bloog title can't be blank"

  Scenario: register successfully
    Given I am on the homepage
    When I follow "Register"
    And I fill in "Username" with "bob"
    And I fill in "Bloog title" with "My Cool Blog"
    And I fill in "Password" with "crazysecret"
    And I fill in "Password confirmation" with "crazysecret"
    And I press "Register"
    Then I should see "Welcome, bob"
    And I should see "Logout"
    And I should not see "You must be logged out"
    And I should see the page header "Posts"

    When I follow "Account"
    And I should see "bob"
    And I should see "My Cool Blog"

  Scenario: edit my account
    Given I am logged in

    When I follow "Account"
    And I follow "Edit"
    And I follow "Cancel"
    And I follow "Edit"

    When I fill in "Bloog title" with ""
    And I press "Update"
    Then I should not see "Account updated!"
    And I should see "Bloog title can't be blank"

    When I fill in "Bloog title" with "New Blog"
    And I press "Update"
    Then I should see "Account updated!"
    And I should see "New Blog"