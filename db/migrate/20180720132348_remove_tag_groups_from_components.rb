class RemoveTagGroupsFromComponents < ActiveRecord::Migration[5.1]
  def change
    remove_column :components, :tag_groups, :string
  end
end
