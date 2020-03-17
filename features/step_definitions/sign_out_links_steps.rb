Given("I am on the homepage") do
  visit root_path
end

Then("I should not see the invoices link") do
  expect(page).to_not have_css("#invoices")
end

Then("I should not see the log out link") do
  expect(page).to_not have_css("#user-logout")
end
