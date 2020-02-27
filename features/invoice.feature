@javascript
Feature: Create invoice

  In order to be able to send invoices to clients, I want to be able to create
  an invoice.

  Scenario: I create an invoice
    Given I have an account
    And I am logged in
    When I create invoice for Google Inc.
    Then I should see a record of that invoice
    And Google Inc. should receive the invoice via email

  Scenario: Total and Tax field are calculated dynamically
    Given I have an account
    And I am logged in
    And I go to the new invoice page
    When I fill in the quantiy field with 10
    And I fill in the price field with 20
    Then I should see the number 200 in the total column
    And I should see the number 38 in the tax column
