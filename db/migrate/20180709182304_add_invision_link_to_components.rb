class AddInvisionLinkToComponents < ActiveRecord::Migration[5.1]
  def change
    add_column :components, :invision_link, :string
  end
end
