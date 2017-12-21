class CreateTextItems < ActiveRecord::Migration[5.1]
  def change
    create_table :text_items do |t|
      t.string :name
      t.text :itemtext

      t.timestamps
    end
  end
end
