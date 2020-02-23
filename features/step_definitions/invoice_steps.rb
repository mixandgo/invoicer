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

When("I create invoice for Google Inc.") do
  click_on "new-invoice-btn"

  # Invoice details
  fill_in "invoice-number", with: "100"
  fill_in "invoice-date", with: "12/22/2020"

  # Customer details
  fill_in "invoice-customer-email", with: "customer@email.com"
  fill_in "invoice-customer-name", with: "Google Inc."
  fill_in "invoice-customer-cif", with: "RO12345678"
  fill_in "invoice-customer-reg", with: "j35/2001/2001"
  fill_in "invoice-customer-address", with: "Bd. Republicii Nr. 2"
  fill_in "invoice-customer-city", with: "Timisoara"
  fill_in "invoice-customer-state", with: "Timis"
  fill_in "invoice-customer-country", with: "Romania"
  fill_in "invoice-customer-zip", with: "300302"

  # Invoice item details
  fill_in "invoice-item-description", with: "Accommodation services"
  fill_in "invoice-item-quantity", with: "3"
  fill_in "invoice-item-price", with: "100"

  click_on "invoice-submit"
end

Then("I should see a record of that invoice") do
  expect(page).to have_content(I18n.t("invoices.create.success"))
  expect(page).to have_css(".invoice-list__customer-name", text: "Google Inc.")
  expect(page).to have_css(".invoice-list__invoice-total", text: "357")
end

Then("Google Inc. should receive the invoice via email") do
  step %{"client@email.com" should receive an email with subject "Foo bar"}
end
