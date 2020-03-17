class InvoiceMailerObserver
  def self.delivered_email(mail)
    invoice_number = mail.header["X-Invoice-No"].value
    invoice = Invoice.find_by(number: invoice_number)
    invoice.touch(:email_sent_at)
  end
end
