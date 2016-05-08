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

ActiveRecord::Schema.define(version: 20160507023848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adquiridos", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "usuario_id"
    t.integer  "perfil_publicacion_id"
  end

  add_index "adquiridos", ["perfil_publicacion_id"], name: "index_adquiridos_on_perfil_publicacion_id", using: :btree
  add_index "adquiridos", ["usuario_id"], name: "index_adquiridos_on_usuario_id", using: :btree

  create_table "archivos", force: :cascade do |t|
    t.text     "descripcion"
    t.text     "linkArchivo"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "tipo_archivo_id"
    t.integer  "perfil_publicacion_id"
  end

  add_index "archivos", ["perfil_publicacion_id"], name: "index_archivos_on_perfil_publicacion_id", using: :btree
  add_index "archivos", ["tipo_archivo_id"], name: "index_archivos_on_tipo_archivo_id", using: :btree

  create_table "denunciars", force: :cascade do |t|
    t.text     "razon"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "perfil_publicacion_id"
    t.integer  "estado_id"
    t.integer  "usuario_id"
    t.integer  "super_usuario_id"
  end

  add_index "denunciars", ["estado_id"], name: "index_denunciars_on_estado_id", using: :btree
  add_index "denunciars", ["perfil_publicacion_id"], name: "index_denunciars_on_perfil_publicacion_id", using: :btree
  add_index "denunciars", ["super_usuario_id"], name: "index_denunciars_on_super_usuario_id", using: :btree
  add_index "denunciars", ["usuario_id"], name: "index_denunciars_on_usuario_id", using: :btree

  create_table "destinatarios", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "mensajes", force: :cascade do |t|
    t.text     "mensaje"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "idea_id"
    t.integer  "usuario_id"
    t.integer  "destinatario_id"
  end

  add_index "mensajes", ["destinatario_id"], name: "index_mensajes_on_destinatario_id", using: :btree
  add_index "mensajes", ["idea_id"], name: "index_mensajes_on_idea_id", using: :btree
  add_index "mensajes", ["usuario_id"], name: "index_mensajes_on_usuario_id", using: :btree

  create_table "perfil_publicacions", force: :cascade do |t|
    t.integer  "visita"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "idea_id"
    t.integer  "estado_id"
    t.integer  "usuario_id"
  end

  add_index "perfil_publicacions", ["estado_id"], name: "index_perfil_publicacions_on_estado_id", using: :btree
  add_index "perfil_publicacions", ["idea_id"], name: "index_perfil_publicacions_on_idea_id", using: :btree
  add_index "perfil_publicacions", ["usuario_id"], name: "index_perfil_publicacions_on_usuario_id", using: :btree

  create_table "postulars", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "usuario_id"
    t.integer  "idea_id"
  end

  add_index "postulars", ["idea_id"], name: "index_postulars_on_idea_id", using: :btree
  add_index "postulars", ["usuario_id"], name: "index_postulars_on_usuario_id", using: :btree

  create_table "rubros", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "super_usuarios", force: :cascade do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.integer  "rut"
    t.string   "email"
    t.string   "pasword"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "tipo_super_usuario_id"
  end

  add_index "super_usuarios", ["tipo_super_usuario_id"], name: "index_super_usuarios_on_tipo_super_usuario_id", using: :btree

  create_table "tipo_archivos", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_super_usuarios", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombreEmpresa"
    t.string   "emailEmpresa"
    t.integer  "rutEmpresa"
    t.string   "pasword"
    t.string   "emailPersona"
    t.string   "apellidosPersona"
    t.string   "nombresPersona"
    t.integer  "rutPersona"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "grado_id"
    t.string   "token1"
    t.string   "token2"
    t.string   "termino_de_uso"
  end

  add_index "usuarios", ["grado_id"], name: "index_usuarios_on_grado_id", using: :btree

  add_foreign_key "adquiridos", "perfil_publicacions"
  add_foreign_key "adquiridos", "usuarios"
  add_foreign_key "archivos", "perfil_publicacions"
  add_foreign_key "archivos", "tipo_archivos"
  add_foreign_key "denunciars", "estados"
  add_foreign_key "denunciars", "perfil_publicacions"
  add_foreign_key "denunciars", "super_usuarios"
  add_foreign_key "denunciars", "usuarios"
  add_foreign_key "mensajes", "destinatarios"
  add_foreign_key "mensajes", "ideas"
  add_foreign_key "mensajes", "usuarios"
  add_foreign_key "perfil_publicacions", "estados"
  add_foreign_key "perfil_publicacions", "ideas"
  add_foreign_key "perfil_publicacions", "usuarios"
  add_foreign_key "postulars", "ideas"
  add_foreign_key "postulars", "usuarios"
  add_foreign_key "super_usuarios", "tipo_super_usuarios"
  add_foreign_key "usuarios", "grados"
end
