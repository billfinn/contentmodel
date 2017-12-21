class CreateTemplateFlows < ActiveRecord::Migration[5.1]
  def change
    create_table :template_flows do |t|
      t.integer :template_id
      t.integer :flow_id

      t.timestamps
    end
  end
end
