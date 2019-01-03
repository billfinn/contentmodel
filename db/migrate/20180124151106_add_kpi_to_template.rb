class AddKpiToTemplate < ActiveRecord::Migration[5.1]
  def change
    add_column :templates, :kpi, :string
  end
end
