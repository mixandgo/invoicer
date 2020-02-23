class InvoiceMailer < ApplicationMailer
  def send_invoice(invoice)
    @invoice = invoice
    subject = I18n.t("mailers.invoice_mailer.send_invoice.subject")
    mail(to: invoice.customer.email, subject: subject)
  end
end
