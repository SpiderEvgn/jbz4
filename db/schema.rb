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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160417145640) do

  create_table "maizuocinemas", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "cityId",         limit: 255
    t.string   "cityName",       limit: 255
    t.string   "cinemaId",       limit: 255
    t.string   "cinemaName",     limit: 255
    t.string   "logo",           limit: 255
    t.string   "address",        limit: 255
    t.string   "region",         limit: 255
    t.string   "phone",          limit: 255
    t.string   "hallId",         limit: 255
    t.string   "hallNames",      limit: 255
    t.string   "seatCounts",     limit: 255
    t.string   "vipflags",       limit: 255
    t.string   "ticketFlag",     limit: 255
    t.string   "seatFlag",       limit: 255
    t.string   "busPath",        limit: 255
    t.string   "subway",         limit: 255
    t.string   "businessCircle", limit: 255
    t.string   "longitude",      limit: 255
    t.string   "latitude",       limit: 255
  end

  create_table "maizuofilms", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "filmId",      limit: 255
    t.string   "name",        limit: 255
    t.string   "director",    limit: 255
    t.string   "actors",      limit: 255
    t.string   "filmType",    limit: 255
    t.string   "area",        limit: 255
    t.string   "length",      limit: 255
    t.string   "releaseDate", limit: 255
    t.string   "isShow",      limit: 255
    t.string   "language",    limit: 255
    t.string   "company",     limit: 255
    t.text     "info",        limit: 65535
    t.string   "picAddr",     limit: 255
    t.string   "dimensional", limit: 255
    t.string   "shortInfo",   limit: 255
    t.string   "videoUrl",    limit: 255
    t.string   "grade",       limit: 255
  end

end
