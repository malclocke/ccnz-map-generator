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

ActiveRecord::Schema.define(:version => 20110308061133) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "color"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_maps", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "map_id"
  end

  create_table "map_renders", :force => true do |t|
    t.integer  "map_id"
    t.string   "status",     :default => "pending"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", :force => true do |t|
    t.string   "title"
    t.string   "paper_size",    :default => "a4"
    t.string   "orientation",   :default => "portrait"
    t.boolean  "include_index", :default => true
    t.float    "left",          :default => 172.53264420557
    t.float    "top",           :default => -43.456246845822
    t.float    "right",         :default => 172.73863785791
    t.float    "bottom",        :default => -43.605592700636
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
