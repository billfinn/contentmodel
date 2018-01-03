class AddOrderToTagMapping < ActiveRecord::Migration[5.1]
  def change
    add_column :tag_mappings, :order, :integer
  end
end
