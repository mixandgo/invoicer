class AddUserInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :company, :string
    add_column :users, :cif, :string
    add_column :users, :reg, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :bank, :string
    add_column :users, :iban, :string
  end
end
