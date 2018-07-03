class AddTemplateComponentIdToTextItems < ActiveRecord::Migration[5.1]
  def change
    add_column :text_items, :template_component_id, :integer
  end
end
