Feature: Sign out links

  When the user is not logged in, we don't want to show him the log out link or
  the invoices link.

  Scenario: Visitor doesn't see the logout & invoices links
    Given I am on the homepage
    Then I should not see the invoices link
    And I should not see the log out link
