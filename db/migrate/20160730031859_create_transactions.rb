class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :transaction_type_id
      t.integer :print_id
      t.decimal :price
      t.decimal :shipping_cost
      t.date :transaction_date
      t.string :description

      t.timestamps
    end
  end
end
