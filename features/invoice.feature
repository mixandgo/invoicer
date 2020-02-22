Feature: Create invoice

  In order to be able to send invoices to clients, I want to be able to create
  an invoice.

  Scenario: I create an invoice
    Given I am logged in
    When I create invoice for Google Inc.
    Then I should see a record of that invoice
    And Google Inc. should receive the invoice via email
