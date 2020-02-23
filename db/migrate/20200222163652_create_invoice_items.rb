class CreateInvoiceItems < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_items do |t|
      t.string :description
      t.string :unit
      t.integer :quantity
      t.decimal :price, precision: 8, scale: 2
      t.decimal :tax, precision: 8, scale: 2
      t.integer :invoice_id

      t.timestamps
    end
  end
end
