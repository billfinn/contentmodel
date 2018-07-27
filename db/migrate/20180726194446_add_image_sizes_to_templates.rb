class AddImageSizesToTemplates < ActiveRecord::Migration[5.1]
  def change
    add_column :templates, :image_sizes, :string
  end
end
