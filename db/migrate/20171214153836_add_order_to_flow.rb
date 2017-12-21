class AddOrderToFlow < ActiveRecord::Migration[5.1]
  def change
    add_column :flows, :order, :integer
  end
end
