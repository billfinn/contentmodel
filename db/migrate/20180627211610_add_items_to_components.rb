class AddItemsToComponents < ActiveRecord::Migration[5.1]
  def change
    add_column :components, :allowed_controls, :string
    add_column :components, :need_info, :string
    add_column :components, :design_questions, :text
    add_column :components, :dev_notes, :text
  end
end
