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

ActiveRecord::Schema.define(version: 20160509132352) do

  create_table "wechat_jbzlocal_cinemas", force: :cascade do |t|
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

  add_index "wechat_jbzlocal_cinemas", ["cinemaId"], name: "index_wechat_jbzlocal_cinemas_on_cinemaId", using: :btree

  create_table "wechat_jbzlocal_foretells", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "cinemaId",       limit: 255
    t.string   "showDate",       limit: 255
    t.string   "showTime",       limit: 255
    t.string   "hallId",         limit: 255
    t.string   "hallName",       limit: 255
    t.string   "foretellId",     limit: 255
    t.string   "filmId",         limit: 255
    t.string   "price",          limit: 255
    t.string   "marketPrice",    limit: 255
    t.string   "flag",           limit: 255
    t.string   "language",       limit: 255
    t.string   "duration",       limit: 255
    t.string   "timeout",        limit: 255
    t.string   "sectionId",      limit: 255
    t.string   "dimensional",    limit: 255
    t.string   "offerId",        limit: 255
    t.string   "lockNeedMobile", limit: 255
  end

  create_table "wechat_jbzlocal_hotfilms", force: :cascade do |t|
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

  add_index "wechat_jbzlocal_hotfilms", ["filmId"], name: "index_wechat_jbzlocal_hotfilms_on_filmId", using: :btree

  create_table "wechat_jbzlocal_orders", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "orderId",           limit: 255
    t.string   "offerId",           limit: 255
    t.string   "confirmId",         limit: 255
    t.string   "offerOrderId",      limit: 255
    t.string   "thirdConfirmId",    limit: 255
    t.string   "takeTicketPostion", limit: 255
    t.text     "smTemplate",        limit: 65535
    t.string   "isCheckGround",     limit: 255
    t.string   "seatType",          limit: 255
    t.string   "mobile",            limit: 255
    t.string   "card",              limit: 255
    t.string   "payMethod",         limit: 255
    t.string   "platformId",        limit: 255
  end

  create_table "wechat_maizuo_cinemas", force: :cascade do |t|
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

  create_table "wechat_maizuo_cinematickets", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "cinemaId",           limit: 255
    t.string   "ticketId",           limit: 255
    t.string   "ticketType",         limit: 255
    t.string   "ticketName",         limit: 255
    t.string   "markerPrice",        limit: 255
    t.string   "price",              limit: 255
    t.string   "desc",               limit: 255
    t.string   "enableDay",          limit: 255
    t.string   "invalidationDate",   limit: 255
    t.string   "effectiveBeginTime", limit: 255
  end

  create_table "wechat_maizuo_confirmorders", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "orderId",           limit: 255
    t.string   "offerId",           limit: 255
    t.string   "confirmId",         limit: 255
    t.string   "offerOrderId",      limit: 255
    t.string   "thirdConfirmId",    limit: 255
    t.string   "takeTicketPostion", limit: 255
    t.text     "smTemplate",        limit: 65535
    t.string   "isCheckGround",     limit: 255
    t.string   "seatType",          limit: 255
    t.string   "mobile",            limit: 255
  end

  create_table "wechat_maizuo_films", force: :cascade do |t|
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

  create_table "wechat_maizuo_foretells", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "cinemaId",       limit: 255
    t.string   "showDate",       limit: 255
    t.string   "showTime",       limit: 255
    t.string   "hallId",         limit: 255
    t.string   "hallName",       limit: 255
    t.string   "foretellId",     limit: 255
    t.string   "filmId",         limit: 255
    t.string   "price",          limit: 255
    t.string   "marketPrice",    limit: 255
    t.string   "flag",           limit: 255
    t.string   "language",       limit: 255
    t.string   "duration",       limit: 255
    t.string   "timeout",        limit: 255
    t.string   "sectionId",      limit: 255
    t.string   "dimensional",    limit: 255
    t.string   "offerId",        limit: 255
    t.string   "lockNeedMobile", limit: 255
  end

  create_table "wechat_maizuo_hallseats", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "cinemaId",    limit: 255
    t.string   "hallId",      limit: 255
    t.string   "seatId",      limit: 255
    t.string   "sectionId",   limit: 255
    t.string   "rowId",       limit: 255
    t.string   "rowNum",      limit: 255
    t.string   "columnId",    limit: 255
    t.string   "columnNum",   limit: 255
    t.string   "damagedFlag", limit: 255
    t.string   "loveIndex",   limit: 255
  end

  create_table "wechat_maizuo_locks", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "orderId",    limit: 255
    t.string   "foretellId", limit: 255
    t.string   "seatId",     limit: 255
    t.string   "count",      limit: 255
    t.string   "price",      limit: 255
    t.string   "totalprice", limit: 255
    t.string   "mobile",     limit: 255
    t.string   "isOrder",    limit: 255
  end

  create_table "wechat_maizuo_realtimeseats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_maizuo_reviews", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "filmId",        limit: 255
    t.string   "reviewId",      limit: 255
    t.string   "author",        limit: 255
    t.string   "authorHeadPic", limit: 255
    t.string   "filmPic",       limit: 255
    t.string   "reviewTime",    limit: 255
    t.string   "reviewContent", limit: 255
  end

  create_table "wechat_zhizhu_cinemas", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "cityId",       limit: 255
    t.string   "regionId",     limit: 255
    t.string   "cinemaId",     limit: 255
    t.string   "cinemaName",   limit: 255
    t.string   "cinemaLogo",   limit: 255
    t.string   "cinemaAdd",    limit: 255
    t.string   "contact",      limit: 255
    t.string   "getTicketWay", limit: 255
    t.string   "endbuyDate",   limit: 255
    t.string   "presaleDay",   limit: 255
    t.string   "longitude",    limit: 255
    t.string   "latitude",     limit: 255
  end

  create_table "wechat_zhizhu_cities", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "cityId",     limit: 255
    t.string   "cityName",   limit: 255
    t.string   "cityType",   limit: 255
  end

  create_table "wechat_zhizhu_regions", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "cityId",     limit: 255
    t.string   "regionId",   limit: 255
    t.string   "regionName", limit: 255
  end

end
