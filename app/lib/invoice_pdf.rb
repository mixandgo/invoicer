require "action_view/helpers/number_helper"

class InvoicePdf
  include ActionView::Helpers::NumberHelper

  attr_reader :invoice

  def initialize(invoice)
    @invoice = invoice
  end

  def create
    pdf = Prawn::Document.new
    pdf.define_grid(columns: 2, rows: 8, gutter: 20)
    pdf.grid([0, 0], [2, 0]).bounding_box do
      user = invoice.customer.user
      user_company = I18n.t("invoices.pdf.user.company") + user.company
      pdf.text user_company
      user_cif = I18n.t("invoices.pdf.user.cif") + user.cif
      pdf.text user_cif
      user_reg = I18n.t("invoices.pdf.user.reg") + user.reg
      pdf.text user_reg
      user_address = I18n.t("invoices.pdf.user.address") + user.address
      pdf.text user_address
      user_city = I18n.t("invoices.pdf.user.city") + user.city
      pdf.text user_city
      user_state = I18n.t("invoices.pdf.user.state") + user.state
      pdf.text user_state
      user_country = I18n.t("invoices.pdf.user.country") + user.country
      pdf.text user_country
      user_zip = I18n.t("invoices.pdf.user.zip") + user.zip
      pdf.text user_zip
      user_bank = I18n.t("invoices.pdf.user.bank") + user.bank
      pdf.text user_bank
      user_iban = I18n.t("invoices.pdf.user.iban") + user.iban
      pdf.text user_iban
    end
    pdf.grid([0, 1], [2, 1]).bounding_box do
      pdf.font_size 20 do
        pdf.text I18n.t("invoices.pdf.title")
      end
      invoice_number = I18n.t("invoices.pdf.number") + invoice.number
      pdf.text invoice_number
      invoice_date = I18n.t("invoices.pdf.date") + invoice.date.
        strftime("%d/%m/%Y")
      pdf.text invoice_date
      pdf.move_down 20

      customer = invoice.customer
      customer_name = I18n.t("invoices.pdf.customer.name") + customer.name
      pdf.text customer_name
      customer_cif = I18n.t("invoices.pdf.customer.cif") + customer.cif
      pdf.text customer_cif
      customer_reg = I18n.t("invoices.pdf.customer.reg") + customer.reg
      pdf.text customer_reg
      customer_address = I18n.t("invoices.pdf.customer.address") +
        customer.address
      pdf.text customer_address
      customer_city = I18n.t("invoices.pdf.customer.city") + customer.city
      pdf.text customer_city
      customer_state = I18n.t("invoices.pdf.customer.state") + customer.state
      pdf.text customer_state
      customer_country = I18n.t("invoices.pdf.customer.country") + customer.country
      pdf.text customer_country
      customer_zip = I18n.t("invoices.pdf.customer.zip") + customer.zip
      pdf.text customer_zip
      customer_bank = I18n.t("invoices.pdf.customer.bank") + customer.bank
      pdf.text customer_bank
      customer_iban = I18n.t("invoices.pdf.customer.iban") + customer.iban
      pdf.text customer_iban
    end

    pdf.move_down 20

    headings = [
      I18n.t("invoices.pdf.table.nr"),
      I18n.t("invoices.pdf.table.description"),
      I18n.t("invoices.pdf.table.unit"),
      I18n.t("invoices.pdf.table.quantity"),
      I18n.t("invoices.pdf.table.price"),
      I18n.t("invoices.pdf.table.item_total"),
      I18n.t("invoices.pdf.table.tax"),
    ]
    invoice_item = invoice.invoice_items.first
    invoice_item_row = [
      "1",
      invoice_item.description,
      invoice_item.unit,
      invoice_item.quantity.to_s,
      invoice_item.price.to_s,
      invoice_item.total.to_s,
      invoice_item.tax.to_s
    ]

    invoice_total = [
      I18n.t("invoices.pdf.table.total"),
      number_with_precision(
        invoice_item.total,
        strip_insignificant_zeros: true
      )
    ].join(": ")
    invoice_total_row = [
      { content: "", colspan: 5 },
      {
        content: "<font size='16'>#{invoice_total}</font>",
        colspan: 2
      }
    ]
    full_width = pdf.bounds.width
    column_widths = {
      0 => (full_width * 5)/100,  # Nr.
      1 => (full_width * 35)/100, # Description
      2 => (full_width * 10)/100, # Unit
      3 => (full_width * 10)/100, # Quantity
      4 => (full_width * 15)/100, # Price
      5 => (full_width * 15)/100, # Item total
      6 => (full_width * 10)/100  # Tax
    }
    pdf.table(
      [ headings, invoice_item_row, invoice_total_row ],
      width: full_width,
      cell_style: { inline_format: true },
      column_widths: column_widths
    )

    pdf.render_file "tmp/invoice_#{invoice.id}.pdf"
    File.read("tmp/invoice_#{invoice.id}.pdf")
  end
end
