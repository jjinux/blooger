Feature: Posts
  So that I can bloog about cool things
  As a user
  I want to write bloog posts

  Scenario: create a new post
    Given I am logged in

    When I follow "New post"
    And I press "Create"
    Then I should see "There were problems with the following fields:"
    And I should see "Title can't be blank"
    And I should see "Body can't be blank"

    When I fill in "Title" with "Cool Title"
    And I fill in "Body" with "Cool body."
    And I press "Create"
    Then I should see "Cool Title"
    And I should see "Cool body."

  Scenario: edit a post
    Given I am logged in
    And there is only one post
    When I follow "Edit Posts"
    And I follow "Show"
    And I follow "Edit"
    And I fill in "Title" with "New Title"
    And I press "Update"
    Then I should see "Post was successfully updated."
    And I should see "New Title"

  Scenario: there are no posts yet
    Given I am logged in
    Then I should see "There are no posts yet."

  Scenario: delete a post
    Given I am logged in
    And there is only one post
    When I follow "Edit Posts"
    Then I should see "Show"

    When I follow "Destroy"
    Then I should see "Post destroyed."
    But I should not see "Show"

  Scenario: use Markdown to format the body
    Given I am logged in

    When I follow "New post"
    And I fill in "Title" with "Title"
    And I fill in "Body" with "We are using __Markdown__ now!<script>&'</script>"
    And I press "Create"
    Then I should see Markdown in strong tags
    And I should not see any script tags

    When I follow "View Bloog"
    Then I should see Markdown in strong tags