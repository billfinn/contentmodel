class AddTemplateIdToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :template_id, :integer
  end
end
