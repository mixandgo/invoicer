class AddUserIdToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :user_id, :integer
  end
end
