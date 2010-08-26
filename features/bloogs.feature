Feature: Bloogs
  So that I can read an interesting blog about boogers
  As a user
  I want to see the list of bloogs, pick one, and read it

  Scenario: the homepage has a list of bloogs
    Given I am on the home page
    Then I should see "There are no bloogs yet."

    When I follow "Blooger"
    Then I should see "There are no bloogs yet."