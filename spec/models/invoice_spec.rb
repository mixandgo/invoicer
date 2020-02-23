require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to have_many(:invoice_items).dependent(:destroy) }

  describe "invoice total" do
    it "calculates the invoice total before saving" do
      invoice = Invoice.new
      ii1 = InvoiceItem.new(description: "Foo", price: 20, quantity: 2)
      ii2 = InvoiceItem.new(description: "Bar", price: 32.12, quantity: 2)
      invoice.invoice_items << [ii1, ii2]
      invoice.save
      expect(invoice.total.to_s).to eq("124.05")
    end
  end
end
