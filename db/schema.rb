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

ActiveRecord::Schema.define(version: 20_200_503_165_951) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'card_moves', force: :cascade do |t|
    t.integer 'from_id'
    t.integer 'to_id'
    t.bigint 'team_member_id', null: false
    t.bigint 'card_id', null: false
    t.datetime 'moved_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'next_move_id'
    t.index ['card_id'], name: 'index_card_moves_on_card_id'
    t.index ['team_member_id'], name: 'index_card_moves_on_team_member_id'
  end

  create_table 'cards', force: :cascade do |t|
    t.bigint 'column_id', null: false
    t.string 'note'
    t.bigint 'team_member_id'
    t.boolean 'archived', default: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'issue_id'
    t.datetime 'updated_on_github_at'
    t.string 'content_url'
    t.index ['column_id'], name: 'index_cards_on_column_id'
    t.index ['issue_id'], name: 'index_cards_on_issue_id'
    t.index ['team_member_id'], name: 'index_cards_on_team_member_id'
  end

  create_table 'columns', force: :cascade do |t|
    t.bigint 'project_id', null: false
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.datetime 'updated_on_github_at'
    t.index ['project_id'], name: 'index_columns_on_project_id'
  end

  create_table 'issues', force: :cascade do |t|
    t.string 'title'
    t.bigint 'team_member_id'
    t.string 'state'
    t.boolean 'locked'
    t.integer 'number'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.datetime 'updated_on_github_at'
    t.string 'html_url'
    t.string 'body'
    t.integer 'assignee_id'
    t.index ['team_member_id'], name: 'index_issues_on_team_member_id'
  end

  create_table 'projects', force: :cascade do |t|
    t.bigint 'team_member_id'
    t.string 'name'
    t.string 'body'
    t.integer 'number'
    t.string 'state'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.datetime 'updated_on_github_at'
    t.string 'html_url'
    t.index ['team_member_id'], name: 'index_projects_on_team_member_id'
  end

  create_table 'team_members', force: :cascade do |t|
    t.string 'login'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.datetime 'updated_on_github_at'
    t.string 'avatar_url'
    t.index ['login'], name: 'index_team_members_on_login'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name'
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'provider'
    t.string 'uid'
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token',
                                      unique: true
  end

  add_foreign_key 'card_moves', 'card_moves', column: 'next_move_id'
  add_foreign_key 'card_moves', 'cards'
  add_foreign_key 'card_moves', 'columns', column: 'from_id'
  add_foreign_key 'card_moves', 'columns', column: 'to_id'
  add_foreign_key 'card_moves', 'team_members'
  add_foreign_key 'cards', 'columns'
  add_foreign_key 'cards', 'issues'
  add_foreign_key 'cards', 'team_members'
  add_foreign_key 'columns', 'projects'
  add_foreign_key 'issues', 'team_members'
  add_foreign_key 'issues', 'team_members', column: 'assignee_id'
  add_foreign_key 'projects', 'team_members'
end
