class CreateLegacySites < ActiveRecord::Migration[5.1]
  def change
    create_table :legacy_sites do |t|
      t.string :name
      t.string :url
      t.integer :domain_authority
      t.integer :traffic
      t.integer :page_count
      t.integer :referring_domains

      t.timestamps
    end
  end
end
