class CreateSiteCrawls < ActiveRecord::Migration[5.1]
  def change
    create_table :site_crawls do |t|
      t.integer :site_id
      t.string :address
      t.string :content
      t.integer :status_code
      t.string :status
      t.string :title_1
      t.integer :title_1_length
      t.integer :title_1_pixel_width
      t.string :meta_description_1
      t.integer :meta_description_1_length
      t.integer :meta_description_1_pixel_width
      t.string :meta_keyword_1
      t.integer :meta_keywords_1_length
      t.string :h1_1
      t.integer :h1_1_length
      t.string :h1_2
      t.integer :h1_2_length
      t.string :h2_1
      t.string :h2_2
      t.integer :h2_1_length
      t.integer :h2_2_length
      t.string :meta_robots_1
      t.string :meta_refresh_1
      t.string :canonical_link_element_1
      t.integer :size
      t.integer :word_count
      t.integer :text_ratio
      t.integer :level
      t.integer :inlinks
      t.integer :outlinks
      t.integer :external_outlinks
      t.string :hash
      t.integer :response_time
      t.string :last_modified
      t.string :redirect_uri

      t.timestamps
    end
  end
end
