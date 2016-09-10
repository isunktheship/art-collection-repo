class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :purchase_id
      t.integer :print_id
      t.decimal :price
      t.decimal :shipping_cost
      t.date :transaction_date
      t.string :description

      t.timestamps
    end
  end
end
