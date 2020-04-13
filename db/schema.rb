# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_413_093_249) do
  create_table 'cards', force: :cascade do |t|
    t.integer 'card_id', null: false
    t.integer 'column_id', null: false
    t.string 'note'
    t.integer 'user_id'
    t.boolean 'archived', default: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['card_id'], name: 'index_cards_on_card_id', unique: true
    t.index ['column_id'], name: 'index_cards_on_column_id'
    t.index ['user_id'], name: 'index_cards_on_user_id'
  end

  create_table 'columns', force: :cascade do |t|
    t.integer 'column_id', null: false
    t.integer 'project_id', null: false
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['column_id'], name: 'index_columns_on_column_id', unique: true
    t.index ['project_id'], name: 'index_columns_on_project_id'
  end

  create_table 'projects', force: :cascade do |t|
    t.integer 'project_id', null: false
    t.integer 'user_id'
    t.string 'name'
    t.string 'body'
    t.integer 'number'
    t.string 'state'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['project_id'], name: 'index_projects_on_project_id', unique: true
    t.index ['user_id'], name: 'index_projects_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'login'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['login'], name: 'index_users_on_login'
    t.index ['user_id'], name: 'index_users_on_user_id'
  end

  add_foreign_key 'cards', 'columns'
  add_foreign_key 'cards', 'users'
  add_foreign_key 'columns', 'projects'
  add_foreign_key 'projects', 'users'
end
