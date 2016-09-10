class CreatePrintSizes < ActiveRecord::Migration
  def change
    create_table :print_sizes do |t|
      t.integer :height
      t.integer :width

      t.timestamps
    end
  end
end
