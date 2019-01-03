class CreateTemplateStrategicPillarMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :template_strategic_pillar_mappings do |t|
      t.integer :strategicpillar_id
      t.integer :template_id

      t.timestamps
    end
  end
end
