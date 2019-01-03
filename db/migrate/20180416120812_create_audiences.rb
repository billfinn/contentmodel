class CreateAudiences < ActiveRecord::Migration[5.1]
  def change
    create_table :audiences do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
