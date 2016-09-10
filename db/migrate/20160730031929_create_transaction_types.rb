class CreateTransactionTypes < ActiveRecord::Migration
  def change
    create_table :transaction_types do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
