class ChangeDataTypeInComponents < ActiveRecord::Migration[5.1]
  def change
    change_column :components, :requirements, :text
    change_column :components, :data, :text
  end
end
