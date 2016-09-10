class CreatePrintStatuses < ActiveRecord::Migration
  def change
    create_table :print_statuses do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
