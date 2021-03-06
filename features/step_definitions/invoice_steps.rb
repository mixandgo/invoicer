Given("I have an account") do
  visit "/"
  click_on "user-registration"
  fill_in "user-company", with: "Mix & Go SRL"
  fill_in "user-cif", with: "RO13708549"
  fill_in "user-reg", with: "j35/165/2001"
  fill_in "user-address", with: "Bd. Liviu Rebreanu 59"
  fill_in "user-city", with: "Timisoara"
  fill_in "user-state", with: "Timis"
  fill_in "user-zip", with: "300755"
  fill_in "user-bank", with: "ING"
  fill_in "user-iban", with: "RO123412341234"
  fill_in "user-email", with: "cezar@mixandgo.com"
  fill_in "user-password", with: "secret1234"
  fill_in "user-password-confirmation", with: "secret1234"
  click_on "user-registration-submit"
  click_on "user-logout"
end

Given("I am logged in") do
  visit "/"
  fill_in "user-email", with: "cezar@mixandgo.com"
  fill_in "user-password", with: "secret1234"
  click_on "login-submit"
end

Given("I go to the new invoice page") do
  visit new_invoice_path
end

When("I create invoice for Google Inc.") do
  create_invoice
end

Given("I have created an invoice") do
  create_invoice
end

Then("I should see a record of that invoice") do
  expect(page).to have_content(I18n.t("invoices.create.success"))
  expect_invoice_row
end

Then("I should see the invoice I've created") do
  expect_invoice_row
end

Then("Google Inc. should receive the invoice via email") do
  subject = I18n.t("mailers.invoice_mailer.send_invoice.subject")
  step %{"customer@email.com" should receive an email with subject "#{subject}"}
end

Then("Google Inc. should receive a PDF version of the invoice via email") do
  open_last_email
  step %{there should be an attachment named "invoice.pdf"}
  step %{attachment 1 should be of type "application/pdf"}
end

When("I fill in the quantiy field with {int}") do |int|
  fill_in "invoice-item-quantity", with: int
end

When("I fill in the price field with {int}") do |int|
  fill_in "invoice-item-price", with: int
end

Then("I should see the number {int} in the total column") do |int|
  expect(find(".invoice-new__item-total").value).to eq(int.to_s)
end

Then("I should see the number {int} in the tax column") do |int|
  expect(find(".invoice-new__item-tax").value).to eq(int.to_s)
end

Then("I should see the number {int} in the invoice total column") do |int|
  expect(page).to have_css("#invoice-total", text: int)
end

When("I go to the invoices list page") do
  click_on "invoices"
end

Then("It should be marked as sent") do
  expect(page)
    .to have_css(".invoice-list__invoice-email_sent", text: "Sep 1, 2020")
end
