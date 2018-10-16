# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181016160328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_admin_managed_resources", force: :cascade do |t|
    t.string "class_name", null: false
    t.string "action", null: false
    t.string "name"
    t.index ["class_name", "action", "name"], name: "active_admin_managed_resources_index", unique: true
  end

  create_table "active_admin_permissions", force: :cascade do |t|
    t.integer "managed_resource_id", null: false
    t.integer "role", limit: 2, default: 0, null: false
    t.integer "state", limit: 2, default: 0, null: false
    t.index ["managed_resource_id", "role"], name: "active_admin_permissions_index", unique: true
  end

  create_table "actual_text_joins", force: :cascade do |t|
    t.integer "text_id"
    t.integer "textitem_id"
    t.integer "page_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.integer "role", limit: 2, default: 0, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "atoms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audience_messages", force: :cascade do |t|
    t.integer "audience_id"
    t.integer "hierarchy_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "site_id"
  end

  create_table "audiences", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "component_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "component_items", force: :cascade do |t|
    t.integer "component_id"
    t.integer "text_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  create_table "component_temp", id: :integer, default: nil, force: :cascade do |t|
    t.string "name"
    t.string "goal"
    t.string "cta"
    t.string "image"
    t.text "page"
    t.text "requirements"
    t.text "interaction_notes"
    t.integer "full_width"
    t.integer "component_group_id"
    t.text "personalization_rules"
    t.text "data"
    t.string "allowed_controls"
    t.string "need_info"
    t.text "design_questions"
    t.text "dev_notes"
    t.string "invision_link"
    t.bigint "xid"
  end

  create_table "component_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "components", force: :cascade do |t|
    t.string "name"
    t.string "goal"
    t.string "cta"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "component_group_id"
    t.text "personalization_rules"
    t.text "requirements"
    t.text "data"
    t.integer "full_width"
    t.string "allowed_controls"
    t.string "need_info"
    t.text "design_questions"
    t.text "dev_notes"
    t.string "invision_link"
    t.string "interaction_notes"
    t.string "page"
    t.string "image_sizes"
  end

  create_table "flows", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "template_id"
    t.integer "order"
  end

  create_table "goals_businesses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals_customers", force: :cascade do |t|
    t.string "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals_strategy_pillars", force: :cascade do |t|
    t.integer "goal_id"
    t.string "strategy_pillar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hierarchies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_hierarchies_on_ancestry"
  end

  create_table "hierarchy_mappings", force: :cascade do |t|
    t.integer "hierarchy_id"
    t.integer "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legacy_sites", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.integer "domain_authority"
    t.integer "traffic"
    t.integer "page_count"
    t.integer "referring_domains"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "molecules", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organisms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_template_mappings", force: :cascade do |t|
    t.integer "page_id"
    t.integer "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_workflows", force: :cascade do |t|
    t.integer "workflow_id"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.integer "site_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["ancestry"], name: "index_pages_on_ancestry"
  end

  create_table "seo_mappings", force: :cascade do |t|
    t.integer "seo_term_id"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seo_terms", force: :cascade do |t|
    t.text "term"
    t.integer "iacategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_crawls", force: :cascade do |t|
    t.integer "site_id"
    t.string "address"
    t.string "content"
    t.integer "status_code"
    t.string "status"
    t.string "title_1"
    t.integer "title_1_length"
    t.integer "title_1_pixel_width"
    t.string "meta_description_1"
    t.integer "meta_description_1_length"
    t.integer "meta_description_1_pixel_width"
    t.string "meta_keyword_1"
    t.integer "meta_keywords_1_length"
    t.string "h1_1"
    t.integer "h1_1_length"
    t.string "h1_2"
    t.integer "h1_2_length"
    t.string "h2_1"
    t.string "h2_2"
    t.integer "h2_1_length"
    t.integer "h2_2_length"
    t.string "meta_robots_1"
    t.string "meta_refresh_1"
    t.string "canonical_link_element_1"
    t.integer "size"
    t.integer "word_count"
    t.integer "text_ratio"
    t.integer "level"
    t.integer "inlinks"
    t.integer "outlinks"
    t.integer "external_outlinks"
    t.integer "response_time"
    t.string "last_modified"
    t.string "redirect_uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_flow_mappings", force: :cascade do |t|
    t.integer "site_id"
    t.integer "flow_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_tag_mappings", force: :cascade do |t|
    t.integer "site_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_taxonomy_mappings", force: :cascade do |t|
    t.integer "site_id"
    t.integer "taxonomy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_template_mappings", force: :cascade do |t|
    t.integer "site_id"
    t.integer "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_mappings", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_tags_on_ancestry"
  end

  create_table "template_audience_mappings", force: :cascade do |t|
    t.integer "audience_id"
    t.integer "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_business_goal_mappings", force: :cascade do |t|
    t.integer "goals_business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "template_id"
    t.integer "position"
  end

  create_table "template_components", force: :cascade do |t|
    t.integer "template_id"
    t.integer "component_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  create_table "template_customer_goal_mappings", force: :cascade do |t|
    t.integer "customergoal_id"
    t.integer "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_flows", force: :cascade do |t|
    t.integer "template_id"
    t.integer "flow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  create_table "template_strategic_pillar_mappings", force: :cascade do |t|
    t.integer "strategicpillar_id"
    t.integer "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_user_story_mappings", force: :cascade do |t|
    t.integer "userstory_id"
    t.integer "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "definition"
    t.string "audience"
    t.string "likely_task"
    t.string "personalization_needs"
    t.text "creation_guidelines"
    t.string "kpi"
    t.boolean "existing"
    t.string "image"
    t.string "document"
    t.string "image_sizes"
    t.text "user_needs"
    t.text "success_longterm"
    t.text "success_shortterm"
    t.string "legacy_reference"
    t.text "additional_requirements"
    t.text "client_dependencies"
    t.text "design_notes"
  end

  create_table "text_items", force: :cascade do |t|
    t.string "name"
    t.text "itemtext"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "text_id"
    t.integer "page_id"
    t.integer "order"
    t.integer "component_id"
    t.integer "template_component_id"
    t.integer "character_count"
  end

  create_table "texts", force: :cascade do |t|
    t.string "name"
    t.text "example"
    t.text "description"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_stories", force: :cascade do |t|
    t.text "user_story"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workflows", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
