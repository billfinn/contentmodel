class AddFullwidthToComponents < ActiveRecord::Migration[5.1]
  def change
    add_column :components, :full_width, :integer
  end
end
