class AddIsTaggableToComponents < ActiveRecord::Migration[5.1]
  def change
    add_column :components, :is_taggable, :integer
  end
end
