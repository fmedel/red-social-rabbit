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

ActiveRecord::Schema.define(version: 20160413024043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adquiridos", force: :cascade do |t|
    t.integer  "idea_ID"
    t.integer  "estado_ID"
    t.integer  "perfil1_ID"
    t.integer  "perfil2_ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "archivos", force: :cascade do |t|
    t.string   "link_archivos"
    t.string   "descripcion_archivo"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "conversaciones", force: :cascade do |t|
    t.integer  "perfil1_ID"
    t.integer  "perfil2_ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "denuncia", force: :cascade do |t|
    t.integer  "perfil_ID"
    t.integer  "publicacion_ID"
    t.string   "razon_de_denuncia"
    t.integer  "estado_ID"
    t.integer  "super_ususario_ID"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "estados", force: :cascade do |t|
    t.string   "estado_descripcion"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "fotos", force: :cascade do |t|
    t.string   "fotos_titulo"
    t.string   "fotos_file_nombre"
    t.string   "fotos_detalles"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "grados", force: :cascade do |t|
    t.string   "grados_descripcion"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "ideas", force: :cascade do |t|
    t.string   "Idea_blog"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mensajes", force: :cascade do |t|
    t.string   "mensaje_mensaje"
    t.datetime "mensaje_fecha"
    t.integer  "conversacion_ID"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "perfiles", force: :cascade do |t|
    t.integer  "rut_perfil_empresa"
    t.string   "email_perfil_empresa"
    t.integer  "rubro_ID"
    t.integer  "usuario_ID"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "perfiles_publicaciones", force: :cascade do |t|
    t.integer  "archivos_ID"
    t.integer  "videos_ID"
    t.integer  "fotos_ID"
    t.integer  "ideas_ID"
    t.integer  "rubro_ID"
    t.integer  "perfil_ID"
    t.integer  "visitas_perfil_publicacion"
    t.datetime "fecha_publicacion"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "personas", force: :cascade do |t|
    t.string   "personas_nombre"
    t.string   "personas_apellido"
    t.integer  "personas_rut"
    t.string   "personas_email"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "postulaciones", force: :cascade do |t|
    t.integer  "idea_ID"
    t.integer  "persona_ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rubros", force: :cascade do |t|
    t.string   "rubros_descripcion"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "super_usuarios", force: :cascade do |t|
    t.string   "super_usuario_email",                  default: "", null: false
    t.string   "super_usuario_encrypted_password",     default: "", null: false
    t.string   "super_usuario_primer_nombre"
    t.string   "super_usuario_primer_apellido"
    t.string   "super_usuario_nombre_perfil"
    t.integer  "super_usuario_tipo"
    t.integer  "super_usuario_rut"
    t.string   "super_usuario_reset_password_token"
    t.datetime "super_usuario_reset_password_sent_at"
    t.datetime "super_usuario_remember_created_at"
    t.integer  "super_usuario_sign_in_count",          default: 0,  null: false
    t.datetime "super_usuario_current_sign_in_at"
    t.datetime "super_usuario_last_sign_in_at"
    t.inet     "super_usuario_current_sign_in_ip"
    t.inet     "super_usuario_last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "super_usuarios", ["super_usuario_email"], name: "index_super_usuarios_on_super_usuario_email", unique: true, using: :btree
  add_index "super_usuarios", ["super_usuario_reset_password_token"], name: "index_super_usuarios_on_super_usuario_reset_password_token", unique: true, using: :btree

  create_table "tipo_super_usuarios", force: :cascade do |t|
    t.string   "tipo_super_usuario_descripcion"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "usuarios_email",                  default: "", null: false
    t.string   "usuariosencrypted_password",      default: "", null: false
    t.integer  "usuarios_grado_ID"
    t.string   "usuarios_nombre_empresa"
    t.integer  "usuarios_persona_ID"
    t.string   "usuarios_reset_password_token"
    t.datetime "usuarios_reset_password_sent_at"
    t.datetime "usuarios_remember_created_at"
    t.integer  "usuarios_sign_in_count",          default: 0,  null: false
    t.datetime "usuarios_current_sign_in_at"
    t.datetime "usuarios_last_sign_in_at"
    t.inet     "usuarios_current_sign_in_ip"
    t.inet     "usuarios_last_sign_in_ip"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "usuarios", ["usuarios_email"], name: "index_usuarios_on_usuarios_email", unique: true, using: :btree
  add_index "usuarios", ["usuarios_reset_password_token"], name: "index_usuarios_on_usuarios_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "video_titulo"
    t.string   "video_file_nombre"
    t.integer  "video_duracion"
    t.string   "video_formato"
    t.string   "video_detalles"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
