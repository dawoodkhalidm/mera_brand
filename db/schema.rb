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

ActiveRecord::Schema.define(version: 20170521224752) do

  create_table "brand_owners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",   limit: 50
    t.string   "last_name",    limit: 50
    t.string   "email",        limit: 50
    t.string   "password",     limit: 15
    t.string   "brand_name",   limit: 50
    t.string   "shop_address", limit: 100
    t.string   "message",      limit: 100
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.float    "rating",       limit: 24,  default: 1.0
    t.integer  "delevery"
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name", limit: 50
    t.string   "last_name",  limit: 50
    t.string   "email",      limit: 50
    t.string   "password",   limit: 15
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "order_quantity", limit: 50
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "brand_owner_id"
    t.integer  "customer_id"
    t.integer  "product_id"
    t.string   "status",                    default: "pending"
    t.boolean  "recieve",                   default: true
    t.index ["brand_owner_id"], name: "index_orders_on_brand_owner_id", using: :btree
    t.index ["customer_id"], name: "index_orders_on_customer_id", using: :btree
    t.index ["product_id"], name: "index_orders_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "product_name",       limit: 50
    t.string   "product_type",       limit: 50
    t.string   "product_quantity",   limit: 50
    t.integer  "product_price"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "brand_owner_id"
    t.integer  "order_count",                   default: 0
    t.index ["brand_owner_id"], name: "index_products_on_brand_owner_id", using: :btree
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "rate",           limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "brand_owner_id"
    t.index ["brand_owner_id"], name: "index_ratings_on_brand_owner_id", using: :btree
  end

end
