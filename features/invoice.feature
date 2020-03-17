@javascript
Feature: Create invoice

  In order to be able to send invoices to clients, I want to be able to create
  an invoice.

  Background:
    Given I have an account
    And I am logged in

  Scenario: I create an invoice
    When I create invoice for Google Inc.
    Then I should see a record of that invoice
    And Google Inc. should receive the invoice via email
    And Google Inc. should receive a PDF version of the invoice via email

  Scenario: Total and Tax fields are calculated dynamically
    Given I go to the new invoice page
    When I fill in the quantiy field with 10
    And I fill in the price field with 20
    Then I should see the number 200 in the total column
    And I should see the number 38 in the tax column
    And I should see the number 238 in the invoice total column

  Scenario: I can see a list of invoices sent
    Given I have created an invoice
    When I go to the invoices list page
    Then I should see the invoice I've created
    And It should be marked as sent
