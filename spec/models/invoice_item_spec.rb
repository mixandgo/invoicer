require "rails_helper"

RSpec.describe InvoiceItem, type: :model do
  it { is_expected.to belong_to(:invoice) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:quantity) }
  it { is_expected.to validate_presence_of(:unit) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:tax) }

  describe "#total" do
    it "returns the total price of an item" do
      ii = InvoiceItem.new(description: "Foo", price: 5, quantity: 2)
      expect(ii.total).to eq(11.9)
    end
  end
end
