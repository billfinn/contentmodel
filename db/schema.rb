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

ActiveRecord::Schema.define(version: 20180130000406) do

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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "atoms", force: :cascade do |t|
    t.string "name"
    t.text "description"
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

  create_table "components", force: :cascade do |t|
    t.string "name"
    t.string "goal"
    t.string "cta"
    t.string "content_assets"
    t.string "image"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "existing"
  end

  create_table "flows", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "template_id"
    t.integer "order"
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

  create_table "template_components", force: :cascade do |t|
    t.integer "template_id"
    t.integer "component_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  create_table "template_flows", force: :cascade do |t|
    t.integer "template_id"
    t.integer "flow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "page_purpose"
    t.string "audience"
    t.string "likely_task"
    t.string "personalization_needs"
    t.text "creation_guidelines"
    t.string "kpi"
    t.boolean "existing"
    t.string "image"
  end

  create_table "text_items", force: :cascade do |t|
    t.string "name"
    t.text "itemtext"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "text_id"
    t.integer "page_id"
    t.integer "order"
  end

  create_table "texts", force: :cascade do |t|
    t.string "name"
    t.text "example"
    t.text "description"
    t.integer "site_id"
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
