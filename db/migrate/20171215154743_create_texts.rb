class CreateTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :texts do |t|
      t.string :name
      t.text :example
      t.text :description
      t.integer :site_id

      t.timestamps
    end
  end
end
