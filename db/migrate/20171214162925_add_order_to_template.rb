class AddOrderToTemplate < ActiveRecord::Migration[5.1]
  def change
    add_column :templates, :order, :integer
  end
end
