Feature: Bloogs
  So that I can read an interesting blog about boogers
  As a user
  I want to see the list of bloogs, pick one, and read it

  Scenario: look at the list of bloogs or create your own
    Given I am on the home page
    Then I should see "There are no bloogs yet."

    When I follow "Blooger"
    Then I should see "There are no bloogs yet."

    When I follow "create your own bloog"
    Then I should see the page header "Register"

    Given I am logged in
    When I follow "Blooger"
    And I follow "bloog about it"
    Then I should see the page header "New Post"