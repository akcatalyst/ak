# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_01_01_000001) do
  create_table "blog_categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_blog_categories_on_slug", unique: true
  end

  create_table "blog_comments", force: :cascade do |t|
    t.text "content", null: false
    t.boolean "approved", default: false
    t.bigint "post_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approved"], name: "index_blog_comments_on_approved"
    t.index ["author_id"], name: "index_blog_comments_on_author_id"
    t.index ["post_id"], name: "index_blog_comments_on_post_id"
  end

  create_table "blog_post_tags", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "tag_id"], name: "index_blog_post_tags_on_post_id_and_tag_id", unique: true
    t.index ["post_id"], name: "index_blog_post_tags_on_post_id"
    t.index ["tag_id"], name: "index_blog_post_tags_on_tag_id"
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.string "slug", null: false
    t.boolean "published", default: false
    t.datetime "published_at"
    t.bigint "author_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_blog_posts_on_author_id"
    t.index ["category_id"], name: "index_blog_posts_on_category_id"
    t.index ["published"], name: "index_blog_posts_on_published"
    t.index ["slug"], name: "index_blog_posts_on_slug", unique: true
  end

  create_table "blog_tags", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_blog_tags_on_slug", unique: true
  end

  create_table "india_documents", force: :cascade do |t|
    t.string "title", null: false
    t.string "document_type", null: false
    t.text "description"
    t.string "file_path"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_india_documents_on_project_id"
  end

  create_table "india_locations", force: :cascade do |t|
    t.string "name", null: false
    t.string "city"
    t.string "state"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "india_projects", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "status", default: 0
    t.date "start_date"
    t.date "end_date"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_india_projects_on_location_id"
    t.index ["status"], name: "index_india_projects_on_status"
  end

  create_table "india_team_members", force: :cascade do |t|
    t.string "name", null: false
    t.string "role", null: false
    t.text "bio"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_india_team_members_on_project_id"
  end

  create_table "space_crew_members", force: :cascade do |t|
    t.string "name", null: false
    t.string "role", null: false
    t.text "bio"
    t.bigint "mission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_space_crew_members_on_mission_id"
  end

  create_table "space_equipment", force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.text "description"
    t.bigint "mission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_space_equipment_on_mission_id"
  end

  create_table "space_locations", force: :cascade do |t|
    t.string "name", null: false
    t.string "coordinates"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "space_missions", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "launch_date", null: false
    t.datetime "end_date"
    t.integer "status", default: 0
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_space_missions_on_location_id"
    t.index ["status"], name: "index_space_missions_on_status"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "blog_comments", "blog_posts", column: "post_id"
  add_foreign_key "blog_comments", "users", column: "author_id"
  add_foreign_key "blog_post_tags", "blog_posts", column: "post_id"
  add_foreign_key "blog_post_tags", "blog_tags", column: "tag_id"
  add_foreign_key "blog_posts", "blog_categories", column: "category_id"
  add_foreign_key "blog_posts", "users", column: "author_id"
  add_foreign_key "india_documents", "india_projects", column: "project_id"
  add_foreign_key "india_projects", "india_locations", column: "location_id"
  add_foreign_key "india_team_members", "india_projects", column: "project_id"
  add_foreign_key "space_crew_members", "space_missions", column: "mission_id"
  add_foreign_key "space_equipment", "space_missions", column: "mission_id"
  add_foreign_key "space_missions", "space_locations", column: "location_id"
end
