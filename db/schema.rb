# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_10_150343) do

  create_table "breweries", force: :cascade do |t|
    t.string "name"
    t.string "brewery_type"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.string "longitude"
    t.string "latitude"
    t.string "phone"
    t.string "website_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "visit_id", null: false
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["visit_id"], name: "index_comments_on_visit_id"
  end

  create_table "user_brew_queues", force: :cascade do |t|
    t.integer "brewery_id", null: false
    t.integer "user_id", null: false
    t.boolean "interested_in"
    t.boolean "favorite"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brewery_id"], name: "index_user_brew_queues_on_brewery_id"
    t.index ["user_id"], name: "index_user_brew_queues_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.integer "age"
    t.string "email_address"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "visits", force: :cascade do |t|
    t.integer "user_brew_queue_id", null: false
    t.date "visit_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "event_name"
    t.index ["user_brew_queue_id"], name: "index_visits_on_user_brew_queue_id"
  end

  add_foreign_key "comments", "visits"
  add_foreign_key "user_brew_queues", "breweries"
  add_foreign_key "user_brew_queues", "users"
  add_foreign_key "visits", "user_brew_queues"
end
