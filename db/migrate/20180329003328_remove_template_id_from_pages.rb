class RemoveTemplateIdFromPages < ActiveRecord::Migration[5.1]
  def change
    remove_column :pages, :template_id, :integer
  end
end
