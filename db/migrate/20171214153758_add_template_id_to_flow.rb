class AddTemplateIdToFlow < ActiveRecord::Migration[5.1]
  def change
    add_column :flows, :template_id, :integer
  end
end
