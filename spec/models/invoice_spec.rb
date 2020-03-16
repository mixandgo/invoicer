require "rails_helper"

RSpec.describe Invoice, type: :model do
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to have_many(:invoice_items).dependent(:destroy) }
  it { is_expected.to validate_uniqueness_of(:number) }
  it { is_expected.to validate_presence_of(:number) }
  it { is_expected.to validate_presence_of(:date) }

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

  describe "#pdf" do
    it "creates a PDF file for the invoice" do
      invoice = create(:invoice)
      invoice.pdf
      expect(File.exists?("tmp/invoice_#{invoice.id}.pdf")).to eq(true)
    end

    it "returns the PDF file content" do
      invoice = create(:invoice)
      pdf_text = PDF::Inspector::Text.analyze(invoice.pdf).strings
      expect(pdf_text).to include(I18n.t("invoices.pdf.title"))
    end

    context "when the invoice is not saved" do
      it "returns nil" do
        invoice = build(:invoice)
        expect(invoice.pdf).to eq(nil)
      end
    end
  end
end
