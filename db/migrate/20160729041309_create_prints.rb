class CreatePrints < ActiveRecord::Migration
  def change
    create_table :prints do |t|
      t.string :title
      t.integer :run_size
      t.date :release_date
      t.decimal :original_price
      t.integer :eb_uid
      t.integer :artist_id
      t.integer :print_size_id
      t.integer :print_class_id
      t.integer :print_status_id
      t.integer :print_technique_id
      t.integer :print_marking_id

      t.timestamps
    end
  end
end
