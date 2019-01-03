class AddFieldsToTemplate < ActiveRecord::Migration[5.1]
  def change
    add_column :templates, :user_needs, :text
    add_column :templates, :success_longterm, :text
    add_column :templates, :success_shortterm, :text
    add_column :templates, :legacy_reference, :string
    add_column :templates, :additional_requirements, :text
    add_column :templates, :client_dependencies, :text
    add_column :templates, :design_notes, :text
  end
end
