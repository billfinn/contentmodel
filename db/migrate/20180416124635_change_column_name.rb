class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :audience_messages, :level_id, :hierarchy_id
  end
end
