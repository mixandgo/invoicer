require "rails_helper"

RSpec.describe InvoicePdf, type: :lib do
  describe "#create" do
    it "creates the PDF file" do
      invoice = instance_double("Invoice", id: "112")
      invoice_pdf = InvoicePdf.new(invoice)
      invoice_pdf.create
      expect(File.exists?("tmp/invoice_112.pdf")).to eq(true)
    end

    it "adds the invoice details to the PDF" do
      invoice = create(:invoice, number: "INV123", date: "21/02/2020")
      invoice_item = create(:invoice_item, invoice: invoice)
      invoice.reload
      invoice_pdf = InvoicePdf.new(invoice)
      invoice_pdf.create
      pdf_file = File.open("tmp/invoice_#{invoice.id}.pdf")
      pdf_text = PDF::Inspector::Text.analyze(pdf_file).strings
      expect(pdf_text).to include(I18n.t("invoices.pdf.title"))
      invoice_number = I18n.t("invoices.pdf.number") + invoice.number
      expect(pdf_text).to include(invoice_number)
      invoice_date = I18n.t("invoices.pdf.date") + invoice.date.
        strftime("%d/%m/%Y")
      expect(pdf_text).to include(invoice_date)

      customer = invoice.customer
      customer_name = I18n.t("invoices.pdf.customer.name") + customer.name
      expect(pdf_text).to include(customer_name)
      customer_cif = I18n.t("invoices.pdf.customer.cif") + customer.cif
      expect(pdf_text).to include(customer_cif)
      customer_reg = I18n.t("invoices.pdf.customer.reg") + customer.reg
      expect(pdf_text).to include(customer_reg)
      customer_address = I18n.t("invoices.pdf.customer.address") +
        customer.address
      expect(pdf_text).to include(customer_address)
      customer_city = I18n.t("invoices.pdf.customer.city") + customer.city
      expect(pdf_text).to include(customer_city)
      customer_state = I18n.t("invoices.pdf.customer.state") + customer.state
      expect(pdf_text).to include(customer_state)
      customer_country = I18n.t("invoices.pdf.customer.country") + customer.country
      expect(pdf_text).to include(customer_country)
      customer_zip = I18n.t("invoices.pdf.customer.zip") + customer.zip
      expect(pdf_text).to include(customer_zip)
      customer_bank = I18n.t("invoices.pdf.customer.bank") + customer.bank
      expect(pdf_text).to include(customer_bank)
      customer_iban = I18n.t("invoices.pdf.customer.iban") + customer.iban
      expect(pdf_text).to include(customer_iban)

      user = customer.user
      user_company = I18n.t("invoices.pdf.user.company") + user.company
      expect(pdf_text).to include(user_company)
      user_cif = I18n.t("invoices.pdf.user.cif") + user.cif
      expect(pdf_text).to include(user_cif)
      user_reg = I18n.t("invoices.pdf.user.reg") + user.reg
      expect(pdf_text).to include(user_reg)
      user_address = I18n.t("invoices.pdf.user.address") + user.address
      expect(pdf_text).to include(user_address)
      user_city = I18n.t("invoices.pdf.user.city") + user.city
      expect(pdf_text).to include(user_city)
      user_state = I18n.t("invoices.pdf.user.state") + user.state
      expect(pdf_text).to include(user_state)
      user_country = I18n.t("invoices.pdf.user.country") + user.country
      expect(pdf_text).to include(user_country)
      user_zip = I18n.t("invoices.pdf.user.zip") + user.zip
      expect(pdf_text).to include(user_zip)
      user_bank = I18n.t("invoices.pdf.user.bank") + user.bank
      expect(pdf_text).to include(user_bank)
      user_iban = I18n.t("invoices.pdf.user.iban") + user.iban
      expect(pdf_text).to include(user_iban)

      invoice_item = invoice.invoice_items.first
      expect(pdf_text).to include(invoice_item.description)
      expect(pdf_text).to include(invoice_item.unit)
      expect(pdf_text).to include(invoice_item.quantity.to_s)
      expect(pdf_text).to include(invoice_item.price.to_s)
      expect(pdf_text).to include(invoice_item.total.to_s)
      expect(pdf_text).to include(invoice_item.tax.to_s)

      expect(pdf_text).to include(I18n.t("invoices.pdf.table.nr"))
      expect(pdf_text).to include(I18n.t("invoices.pdf.table.description"))
      expect(pdf_text).to include(I18n.t("invoices.pdf.table.unit"))
      expect(pdf_text).to include(I18n.t("invoices.pdf.table.quantity"))
      expect(pdf_text).to include(I18n.t("invoices.pdf.table.price"))
      expect(pdf_text).to include(I18n.t("invoices.pdf.table.item_total"))
      expect(pdf_text).to include(I18n.t("invoices.pdf.table.tax"))
      msg = I18n.t("invoices.pdf.table.total")
      expect(pdf_text).to include("#{msg}: 119")
    end
  end
end
