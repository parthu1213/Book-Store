class ChangeMobilenumberToBeStringInOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :mobilenumber, :string
  end
end
