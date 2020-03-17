module Helpers
  def create_invoice
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

  def expect_invoice_row
    expect(page).to have_css(".invoice-list__invoice_number", text: "100")
    expect(page).to have_css(".invoice-list__customer-name", text: "Google Inc.")
    expect(page).to have_css(".invoice-list__invoice-total", text: "357")
    expect(page).to have_css(".invoice-list__invoice-date", text: "Sep 1, 2020")
  end
end

World(Helpers)
