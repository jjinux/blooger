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

    When I follow "Blooger"
    And I follow "Joe's Blog"
    Then I should see the page header "Joe's Blog"

  Scenario: view the list of bloog posts
    Given I am logged in
    When I follow "Blooger"
    And I follow "Joe's Blog"
    Then I should see "There are no bloog posts yet."

    Given there is only one post
    When I reload the page
    Then I should see "One Post Title"
    And I should see "One post body."