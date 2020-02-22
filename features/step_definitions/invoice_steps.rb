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
  # Client details
  fill_in "invoice-client-email", with: "client@email.com"
  fill_in "invoice-client-name", with: "Google Inc."
  fill_in "invoice-client-cif", with: "RO12345678"
  fill_in "invoice-client-reg", with: "j35/2001/2001"
  fill_in "invoice-client-address", with: "Bd. Republicii Nr. 2"
  fill_in "invoice-client-city", with: "Timisoara"
  fill_in "invoice-client-state", with: "Timis"
  fill_in "invoice-client-zip", with: "300302"

  # Invoice details
  fill_in "invoice-description", with: "Accommodation services"
  fill_in "invoice-qty", with: "3"
  fill_in "invoice-price", with: "100"

  click_on "invoice-submit"
end

Then("I should see a record of that invoice") do
  expect(page).to have_xpath("//tr/td[text()='Google Inc.' and td[text()='120']]")
end

Then("Google Inc. should receive the invoice via email") do
  step %{"client@email.com" should receive an email with subject "Foo bar"}
end
