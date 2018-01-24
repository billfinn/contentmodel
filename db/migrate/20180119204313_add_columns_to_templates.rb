class AddColumnsToTemplates < ActiveRecord::Migration[5.1]
  def change
    add_column :templates, :audience, :string
    add_column :templates, :likely_task, :string
    add_column :templates, :personalization_needs, :string
    add_column :templates, :creation_guidelines, :text
  end
end
