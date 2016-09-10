class CreatePrintMarkings < ActiveRecord::Migration
  def change
    create_table :print_markings do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
