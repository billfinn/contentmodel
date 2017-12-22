class AddAncestryToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :ancestry, :string
    add_index :tags, :ancestry
  end
end
