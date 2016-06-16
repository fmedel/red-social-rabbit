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

ActiveRecord::Schema.define(version: 20160616031241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apelars", force: :cascade do |t|
    t.text     "razon"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "estado_id"
    t.integer  "denuncia_id"
  end

  add_index "apelars", ["denuncia_id"], name: "index_apelars_on_denuncia_id", using: :btree
  add_index "apelars", ["estado_id"], name: "index_apelars_on_estado_id", using: :btree

  create_table "aquiridos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "idea_id"
  end

  add_index "aquiridos", ["idea_id"], name: "index_aquiridos_on_idea_id", using: :btree
  add_index "aquiridos", ["user_id"], name: "index_aquiridos_on_user_id", using: :btree

  create_table "denuncia", force: :cascade do |t|
    t.text     "razon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "idea_id"
    t.integer  "estado_id"
  end

  add_index "denuncia", ["estado_id"], name: "index_denuncia_on_estado_id", using: :btree
  add_index "denuncia", ["idea_id"], name: "index_denuncia_on_idea_id", using: :btree
  add_index "denuncia", ["user_id"], name: "index_denuncia_on_user_id", using: :btree

  create_table "estados", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "grados", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ideas", force: :cascade do |t|
    t.string   "titulo"
    t.text     "contenido"
    t.integer  "visita"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "estado_id"
  end

  add_index "ideas", ["estado_id"], name: "index_ideas_on_estado_id", using: :btree
  add_index "ideas", ["user_id"], name: "index_ideas_on_user_id", using: :btree

  create_table "mensajes", force: :cascade do |t|
    t.text     "mensaje"
    t.boolean  "visto_duenio"
    t.boolean  "visto_destinatario"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.integer  "idea_id"
  end

  add_index "mensajes", ["idea_id"], name: "index_mensajes_on_idea_id", using: :btree
  add_index "mensajes", ["user_id"], name: "index_mensajes_on_user_id", using: :btree

  create_table "postulars", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.integer  "idea_id"
    t.string   "oferta",     default: "", null: false
  end

  add_index "postulars", ["idea_id"], name: "index_postulars_on_idea_id", using: :btree
  add_index "postulars", ["user_id"], name: "index_postulars_on_user_id", using: :btree

  create_table "tipos", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "grado_id"
    t.string   "nombre_empresa",         default: "", null: false
    t.integer  "rut_empresa",            default: 0,  null: false
    t.string   "email_persona",          default: "", null: false
    t.string   "apellidos_persona",      default: "", null: false
    t.string   "nombres_persona",        default: "", null: false
    t.integer  "rut_persona",            default: 0,  null: false
    t.integer  "tipo_id",                default: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["email_persona"], name: "index_users_on_email_persona", unique: true, using: :btree
  add_index "users", ["grado_id"], name: "index_users_on_grado_id", using: :btree
  add_index "users", ["nombre_empresa"], name: "index_users_on_nombre_empresa", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["rut_empresa"], name: "index_users_on_rut_empresa", unique: true, using: :btree
  add_index "users", ["rut_persona"], name: "index_users_on_rut_persona", unique: true, using: :btree
  add_index "users", ["tipo_id"], name: "index_users_on_tipo_id", using: :btree

  add_foreign_key "apelars", "estados"
  add_foreign_key "aquiridos", "ideas"
  add_foreign_key "aquiridos", "users"
  add_foreign_key "denuncia", "estados"
  add_foreign_key "denuncia", "ideas"
  add_foreign_key "denuncia", "users"
  add_foreign_key "ideas", "estados"
  add_foreign_key "mensajes", "ideas"
  add_foreign_key "mensajes", "users"
  add_foreign_key "postulars", "ideas"
  add_foreign_key "postulars", "users"
  add_foreign_key "users", "grados"
  add_foreign_key "users", "tipos"
end
