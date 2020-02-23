require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { is_expected.to belong_to(:invoice) }

  describe "#total" do
    it "returns the total price of an item" do
      ii = InvoiceItem.new(description: "Foo", price: 5, quantity: 2)
      expect(ii.total).to eq(11.9)
    end
  end
end
