class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :first_name
      t.string :last_name
      t.integer :eb_uid
      t.string :website
      t.string :twitter

      t.timestamps
    end
  end
end
