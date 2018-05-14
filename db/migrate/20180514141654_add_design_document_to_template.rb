class AddDesignDocumentToTemplate < ActiveRecord::Migration[5.1]
  def change
    add_column :templates, :document, :string
  end
end
