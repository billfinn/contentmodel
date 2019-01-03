class AddExistingToTemplate < ActiveRecord::Migration[5.1]
  def change
    add_column :templates, :existing, :boolean
  end
end
