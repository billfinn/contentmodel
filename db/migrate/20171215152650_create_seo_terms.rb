class CreateSeoTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :seo_terms do |t|
      t.text :term
      t.integer :iacategory_id

      t.timestamps
    end
  end
end
