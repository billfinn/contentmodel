class CreateComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :components do |t|
      t.string :name
      t.string :goal
      t.string :cta
      t.string :content_assets
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
