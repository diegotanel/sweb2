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

ActiveRecord::Schema.define(version: 20151116184127) do

  create_table "asist_tecs", force: :cascade do |t|
    t.string   "nombre_grupo",  null: false
    t.date     "anio_inicio",   null: false
    t.string   "num_registro",  null: false
    t.string   "nombre",        null: false
    t.string   "apellido",      null: false
    t.string   "num_cuit",      null: false
    t.string   "domicilio",     null: false
    t.string   "codigo_postal", null: false
    t.string   "localidad",     null: false
    t.string   "provincia",     null: false
    t.string   "email",         null: false
    t.string   "telefono",      null: false
    t.string   "monto_letra",   null: false
    t.string   "monto_numero",  null: false
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

  create_table "funcionamiento_salas", force: :cascade do |t|
    t.string   "nombre_sala",             null: false
    t.date     "fecha_inicio",            null: false
    t.string   "domicilio_sala",          null: false
    t.string   "localidad_sala",          null: false
    t.string   "codigo_postal_sala",      null: false
    t.string   "provincia_sala",          null: false
    t.text     "descripcion_proyecto",    null: false
    t.text     "descripcion_estrategias", null: false
    t.text     "detalle_plan_gastos",     null: false
    t.string   "nombre",                  null: false
    t.string   "apellido",                null: false
    t.string   "num_cuit",                null: false
    t.string   "domicilio",               null: false
    t.string   "codigo_postal",           null: false
    t.string   "localidad",               null: false
    t.string   "provincia",               null: false
    t.string   "email",                   null: false
    t.string   "telefono",                null: false
    t.string   "monto_letra",             null: false
    t.string   "monto_numero",            null: false
    t.integer  "estado"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "funcionamiento_salas_users", id: false, force: :cascade do |t|
    t.integer "funcionamiento_sala_id", null: false
    t.integer "user_id",                null: false
  end

  add_index "funcionamiento_salas_users", ["funcionamiento_sala_id", "user_id"], name: "func_sala_users_index", unique: true
  add_index "funcionamiento_salas_users", ["funcionamiento_sala_id"], name: "index_funcionamiento_salas_users_on_funcionamiento_sala_id"
  add_index "funcionamiento_salas_users", ["user_id"], name: "index_funcionamiento_salas_users_on_user_id"

  create_table "funcionamiento_salas_v2", force: :cascade do |t|
    t.string   "nombre_sala"
    t.date     "fecha_inicio_sala"
    t.string   "domicilio_sala"
    t.string   "localidad_sala"
    t.string   "codigo_postal_sala"
    t.string   "provincia_sala"
    t.date     "fecha_inicio_periodo_de_subsidio"
    t.boolean  "solicitud_de_subsidio_por_primera_vez"
    t.boolean  "recibio_subsidio_en_el_periodo_inmediatamente_anterior"
    t.boolean  "algun_integrante_participa"
    t.boolean  "solicito_apoyo"
    t.date     "fecha_del_ultimo_periodo_subsidiado_desde"
    t.date     "fecha_del_ultimo_periodo_subsidiado_hasta"
    t.text     "descripcion_proyecto"
    t.text     "descripcion_estrategias"
    t.text     "detalle_plan_gastos"
    t.string   "nombre_responsable"
    t.string   "apellido_responsable"
    t.string   "num_cuit_responsable"
    t.string   "domicilio_responsable"
    t.string   "codigo_postal_responsable"
    t.string   "localidad_responsable"
    t.string   "provincia_responsable"
    t.string   "email_responsable"
    t.string   "telefono_responsable"
    t.string   "monto_letra"
    t.string   "monto_numero"
    t.integer  "estado"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instituciones_que_dieron_apoyo", force: :cascade do |t|
    t.string   "institucion"
    t.string   "estado_de_apoyo"
    t.integer  "funcionamiento_sala_v2_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "instituciones_que_dieron_apoyo", ["funcionamiento_sala_v2_id"], name: "instituciones_subs_on_func_sala_v2"

  create_table "integrantes_asist_tec", force: :cascade do |t|
    t.string   "nombre",           null: false
    t.string   "apellido",         null: false
    t.string   "dni",              null: false
    t.date     "fecha_nacimiento", null: false
    t.string   "email",            null: false
    t.string   "domicilio",        null: false
    t.string   "telefono",         null: false
    t.string   "rol",              null: false
    t.integer  "asist_tec_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "integrantes_asist_tec", ["asist_tec_id"], name: "index_integrantes_asist_tec_on_asist_tec_id"

  create_table "integrantes_participa_proyecto_subsidio", force: :cascade do |t|
    t.string   "nombre_y_apellido"
    t.string   "proyecto_en_el_que_participa"
    t.string   "tipo_subsidio_solicitado"
    t.integer  "funcionamiento_sala_v2_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "integrantes_participa_proyecto_subsidio", ["funcionamiento_sala_v2_id"], name: "int_proy_subs_on_func_sala_v2"

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

  create_table "registros_plan_de_gasto_de_funcionamiento_de_sala", force: :cascade do |t|
    t.string   "rubro"
    t.decimal  "monto"
    t.integer  "funcionamiento_sala_v2_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "registros_plan_de_gasto_de_funcionamiento_de_sala", ["funcionamiento_sala_v2_id"], name: "index_reg_plan_de_gasto_on_func_sala_v2"

  create_table "room_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "room_categories", ["hotel_id"], name: "index_room_categories_on_hotel_id"

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
