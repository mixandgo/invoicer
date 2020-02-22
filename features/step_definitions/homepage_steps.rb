Given("I go the homepage") do
  visit "/"
end

Then("I should see a welcome message") do
  expect(page).to have_content("Hello")
end
