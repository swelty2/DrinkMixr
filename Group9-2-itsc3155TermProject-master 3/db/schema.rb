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

ActiveRecord::Schema.define(version: 2018_11_15_161138) do

  create_table "drink_liquors", force: :cascade do |t|
    t.integer "drink_id"
    t.integer "liquor_id"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drink_id"], name: "index_drink_liquors_on_drink_id"
    t.index ["liquor_id"], name: "index_drink_liquors_on_liquor_id"
  end

  create_table "drink_mixers", force: :cascade do |t|
    t.integer "drink_id"
    t.integer "mixer_id"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drink_id"], name: "index_drink_mixers_on_drink_id"
    t.index ["mixer_id"], name: "index_drink_mixers_on_mixer_id"
  end

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.decimal "alcoholPerVolume", precision: 4, scale: 2
    t.integer "flavor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "liquors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mixers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
