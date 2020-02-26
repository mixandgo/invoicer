require "rails_helper"

RSpec.describe InvoiceItem, type: :model do
  it { is_expected.to belong_to(:invoice) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:quantity) }
  it { is_expected.to validate_presence_of(:unit) }
  it { is_expected.to validate_presence_of(:price) }

  describe "#total" do
    it "returns the total price of an item" do
      ii = build(:invoice_item, price: 5, quantity: 2)
      expect(ii.total).to eq(11.9)
    end
  end

  describe "invoice tax" do
    it "calculates the tax of an item before saving" do
      invoice = Invoice.new(number: "1", date: "12/22/2020")
      ii = build(:invoice_item)
      ii.invoice = invoice
      ii.save
      expect(ii.tax.to_f).to eq(Constants::TAX)
    end
  end
end
