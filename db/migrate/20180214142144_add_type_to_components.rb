class AddTypeToComponents < ActiveRecord::Migration[5.1]
  def change
    add_column :components, :componenttype_id, :integer
  end
end
