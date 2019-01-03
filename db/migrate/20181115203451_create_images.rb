class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :name
      t.string :image_url
      t.text :description

      t.timestamps
    end
  end
end
