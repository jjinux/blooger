Feature: Layout
  So that I put my layout-related tests somewhere sensible
  As a coder
  I've create this feature file ;)

  Scenario: footer
    Given I am on the homepage
    Then I should see "Terms of Use"
    And I should see "Copyright 2010 Booger Lovers, Inc."
