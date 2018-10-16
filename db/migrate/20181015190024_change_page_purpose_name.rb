class ChangePagePurposeName < ActiveRecord::Migration[5.1]
  def change
    rename_column :templates, :page_purpose, :definition
  end
end
