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

ActiveRecord::Schema[7.0].define(version: 2023_04_25_173155) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "answerer_id", null: false
    t.bigint "question_id", null: false
    t.text "description", null: false
    t.bigint "editor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id"
    t.index ["answerer_id"], name: "index_answers_on_answerer_id"
    t.index ["author_id"], name: "index_answers_on_author_id"
    t.index ["editor_id"], name: "index_answers_on_editor_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "notification_type"
    t.integer "user_id"
    t.integer "answer_id"
    t.integer "question_id"
    t.boolean "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.integer "views", default: 0, null: false
    t.bigint "author_id", null: false
    t.bigint "editor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_questions_on_author_id"
    t.index ["editor_id"], name: "index_questions_on_editor_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_taggings_on_question_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "display_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "voter_id", null: false
    t.bigint "post_id", null: false
    t.boolean "vote", null: false
    t.boolean "post_type", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_votes_on_post_id"
    t.index ["voter_id"], name: "index_votes_on_voter_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users", column: "answerer_id"
  add_foreign_key "answers", "users", column: "editor_id"
  add_foreign_key "questions", "users", column: "author_id"
  add_foreign_key "questions", "users", column: "editor_id"
  add_foreign_key "taggings", "questions"
  add_foreign_key "taggings", "tags"
  add_foreign_key "votes", "users", column: "voter_id"
end
