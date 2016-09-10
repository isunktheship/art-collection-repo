class CreatePrintPricePoints < ActiveRecord::Migration
  def change
    create_table :print_price_points do |t|
      t.integer :print_id
      t.decimal :six_month_average_price
      t.decimal :average_price

      t.timestamps
    end
  end
end
