class AddBankInfoToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :bank, :string
    add_column :customers, :iban, :string
  end
end
