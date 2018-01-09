class AddOrderToTextItems < ActiveRecord::Migration[5.1]
  def change
    add_column :text_items, :order, :integer
  end
end
