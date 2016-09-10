class CreatePrintTechniques < ActiveRecord::Migration
  def change
    create_table :print_techniques do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
