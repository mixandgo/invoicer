class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :number
      t.date :date
      t.references :customer

      t.timestamps
    end
  end
end
