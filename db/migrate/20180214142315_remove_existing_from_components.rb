class RemoveExistingFromComponents < ActiveRecord::Migration[5.1]
  def change
    remove_column :components, :existing, :boolean
  end
end
