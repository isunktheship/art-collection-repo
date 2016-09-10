class CreatePrintClasses < ActiveRecord::Migration
  def change
    create_table :print_classes do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
