class CreateTemplateComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :template_components do |t|
      t.integer :template_id
      t.integer :component_id

      t.timestamps
    end
  end
end
