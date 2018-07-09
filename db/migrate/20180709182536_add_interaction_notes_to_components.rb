class AddInteractionNotesToComponents < ActiveRecord::Migration[5.1]
  def change
    add_column :components, :interaction_notes, :string
  end
end
