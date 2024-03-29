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

ActiveRecord::Schema.define(version: 2019_05_13_061200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "scores", force: :cascade do |t|
    t.integer "score"
    t.string "touchpoint"
    t.string "respondent_class"
    t.integer "respondent_id"
    t.string "object_class"
    t.integer "object_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["touchpoint", "object_class"], name: "index_scores_on_touchpoint_and_object_class"
    t.index ["touchpoint", "respondent_class", "object_class"], name: "scores_whole_query"
    t.index ["touchpoint", "respondent_class"], name: "index_scores_on_touchpoint_and_respondent_class"
    t.index ["touchpoint"], name: "index_scores_on_touchpoint"
  end

end
