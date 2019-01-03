class AddExistingToComponents < ActiveRecord::Migration[5.1]
  def change
    add_column :components, :existing, :boolean
  end
end
