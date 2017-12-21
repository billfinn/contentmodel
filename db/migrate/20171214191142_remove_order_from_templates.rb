class RemoveOrderFromTemplates < ActiveRecord::Migration[5.1]
  def change
    remove_column :templates, :order, :integer
  end
end
