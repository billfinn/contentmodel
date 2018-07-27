class AddImageSizesToComponents < ActiveRecord::Migration[5.1]
  def change
    add_column :components, :image_sizes, :string
  end
end
