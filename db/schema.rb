# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_10_04_192841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bombas", force: :cascade do |t|
    t.string "descripcion"
    t.string "coordenadas"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bombas_clientes", force: :cascade do |t|
    t.bigint "bomba_id", null: false
    t.bigint "cliente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bomba_id"], name: "index_bombas_clientes_on_bomba_id"
    t.index ["cliente_id"], name: "index_bombas_clientes_on_cliente_id"
  end

  create_table "cargos", force: :cascade do |t|
    t.string "descripcion"
    t.integer "sueldo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ciudades", force: :cascade do |t|
    t.string "ciudad"
    t.integer "pais_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.string "razon_social"
    t.string "ruc"
    t.integer "bomba_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "empleados", force: :cascade do |t|
    t.integer "persona_id"
    t.integer "cargo_id"
    t.integer "ubicacion_id"
    t.integer "ciudad_id"
    t.integer "pais_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "paises", force: :cascade do |t|
    t.string "pais"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "personas", force: :cascade do |t|
    t.string "nombre"
    t.integer "edad"
    t.string "cargo_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ubicaciones", force: :cascade do |t|
    t.string "direccion"
    t.integer "ciudad_id"
    t.integer "pais_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bombas_clientes", "bombas"
  add_foreign_key "bombas_clientes", "clientes"
end
