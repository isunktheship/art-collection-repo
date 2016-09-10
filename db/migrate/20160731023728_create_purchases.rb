class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :print_id
      t.decimal :price
      t.decimal :shipping_cost
      t.date :transaction_date
      t.string :description

      t.timestamps
    end
  end
end
