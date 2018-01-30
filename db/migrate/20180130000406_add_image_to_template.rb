class AddImageToTemplate < ActiveRecord::Migration[5.1]
  def change
    add_column :templates, :image, :string
  end
end
