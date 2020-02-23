class RenameCitToCifForCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :customers, :cit, :cif
  end
end
