class AddSentDateToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :email_sent_at, :timestamp
  end
end
