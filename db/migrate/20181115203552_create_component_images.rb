class CreateComponentImages < ActiveRecord::Migration[5.1]
  def change
    create_table :component_images do |t|
      t.integer :image_id
      t.integer :component_id
      t.integer :position

      t.timestamps
    end
  end
end
