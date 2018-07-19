class RemoveItemsFromComponents < ActiveRecord::Migration[5.1]
  def change
    remove_column :components, :content_assets, :text
    remove_column :components, :description, :text
    remove_column :components, :componenttype_id, :integer
    remove_column :components, :ispersonalized, :integer
    remove_column :components, :is_taggable, :integer
    remove_column :components, :vsts_id, :integer
  end
end
