require "rails_helper"

RSpec.describe InvoiceMailer, type: :mailer do
  describe "send_invoice" do
    let(:customer) { Customer.new(email: "customer@email.com") }
    let(:invoice_item) do
      InvoiceItem.new(description: "Foo", price: 5, quantity: 2)
    end
    let(:invoice) do
      Invoice.create(customer: customer, invoice_items: [invoice_item])
    end
    let(:mail) { InvoiceMailer.send_invoice(invoice) }

    it "renders the headers" do
      subject = I18n.t("mailers.invoice_mailer.send_invoice.subject")
      expect(mail.subject).to eq(subject)
      expect(mail.to).to eq(["customer@email.com"])
    end

    it "renders the body" do
      body = I18n.t("mailers.invoice_mailer.send_invoice.body", total: "11.9")
      expect(mail.body.encoded).to match(body)
    end
  end
end
