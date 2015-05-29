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

ActiveRecord::Schema.define(version: 20150519181454) do

  create_table "asist_tecs", force: :cascade do |t|
    t.string   "nombre",     null: false
    t.string   "apellido",   null: false
    t.string   "num_cuit",   null: false
    t.text     "detalle",    null: false
    t.integer  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "becas_artis", force: :cascade do |t|
    t.string   "nombre",     null: false
    t.string   "apellido",   null: false
    t.string   "num_cuit",   null: false
    t.text     "detalle",    null: false
    t.integer  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "becas_estudios", force: :cascade do |t|
    t.string   "nombre",     null: false
    t.string   "apellido",   null: false
    t.string   "num_cuit",   null: false
    t.text     "detalle",    null: false
    t.integer  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "becas_gestion", force: :cascade do |t|
    t.string   "nombre",     null: false
    t.string   "apellido",   null: false
    t.string   "num_cuit",   null: false
    t.text     "detalle",    null: false
    t.integer  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pros_inves", force: :cascade do |t|
    t.string   "nombre",     null: false
    t.string   "apellido",   null: false
    t.string   "num_cuit",   null: false
    t.text     "detalle",    null: false
    t.integer  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pub_eventuales", force: :cascade do |t|
    t.string   "nombre",     null: false
    t.string   "apellido",   null: false
    t.string   "num_cuit",   null: false
    t.text     "detalle",    null: false
    t.integer  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pub_periodicas", force: :cascade do |t|
    t.string   "nombre",     null: false
    t.string   "apellido",   null: false
    t.string   "num_cuit",   null: false
    t.text     "detalle",    null: false
    t.integer  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "realiza_eventos", force: :cascade do |t|
    t.string   "nombre",     null: false
    t.string   "apellido",   null: false
    t.string   "num_cuit",   null: false
    t.text     "detalle",    null: false
    t.integer  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tramites", force: :cascade do |t|
    t.integer  "tramitable_id"
    t.string   "tramitable_type"
    t.integer  "user_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "tramites", ["tramitable_id", "tramitable_type"], name: "index_tramites_on_tramitable_id_and_tramitable_type"
  add_index "tramites", ["user_id"], name: "index_tramites_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "last_name",      null: false
    t.string   "email",          null: false
    t.string   "password",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
