class CreateComponentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :component_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
