class AddTagGroupsToComponents < ActiveRecord::Migration[5.1]
  def change
    add_column :components, :tag_groups, :string
  end
end
