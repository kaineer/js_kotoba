# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120717055140) do

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "ancestry"
    t.boolean  "public"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["ancestry"], :name => "index_tags_on_ancestry"
  add_index "tags", ["user_id", "public"], :name => "index_tags_on_user_id_and_public"

  create_table "tangos", :force => true do |t|
    t.string  "kanji"
    t.string  "kana"
    t.string  "meaning"
    t.integer "jlpt"
  end

end
