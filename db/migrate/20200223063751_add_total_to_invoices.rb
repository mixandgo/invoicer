class AddTotalToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :total, :decimal, precision: 8, scale: 2
  end
end
