class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :address
      t.integer :mobilenumber

      t.timestamps
    end
  end
end
