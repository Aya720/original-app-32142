class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :title
      t.text :caption
      t.references :folder, foreign_key: true
      t.timestamps
    end
  end
end
