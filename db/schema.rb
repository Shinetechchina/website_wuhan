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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131105101829) do

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "access_token"
    t.datetime "expires_in"
  end

  create_table "box_sets", :force => true do |t|
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "boxes", :force => true do |t|
    t.integer  "position"
    t.integer  "boxable_id"
    t.string   "boxable_type"
    t.string   "template"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "url"
    t.integer  "box_set_id"
    t.boolean  "expanded",     :default => false
    t.integer  "expand_cols"
  end

  create_table "icons", :force => true do |t|
    t.string   "title"
    t.integer  "staff_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_custom_boxes", :force => true do |t|
    t.string   "title"
    t.integer  "width"
    t.integer  "height"
    t.text     "content"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_customs", :force => true do |t|
    t.string   "title"
    t.integer  "width"
    t.integer  "height"
    t.text     "content"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_images", :force => true do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.string   "image_ext"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "refinery_messages", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.integer  "position"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "staff_id"
    t.string   "phone_number"
    t.string   "company"
    t.string   "from_ip"
    t.string   "browser"
    t.string   "platform"
  end

  create_table "refinery_modals", :force => true do |t|
    t.string   "title"
    t.string   "path"
    t.text     "content"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "width"
    t.integer  "height"
  end

  create_table "refinery_page_part_translations", :force => true do |t|
    t.integer  "refinery_page_part_id"
    t.string   "locale"
    t.text     "body"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "refinery_page_part_translations", ["locale"], :name => "index_refinery_page_part_translations_on_locale"
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], :name => "index_refinery_page_part_translations_on_refinery_page_part_id"

  create_table "refinery_page_parts", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "refinery_page_parts", ["id"], :name => "index_refinery_page_parts_on_id"
  add_index "refinery_page_parts", ["refinery_page_id"], :name => "index_refinery_page_parts_on_refinery_page_id"

  create_table "refinery_page_translations", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "locale"
    t.string   "title"
    t.string   "custom_slug"
    t.string   "menu_title"
    t.string   "slug"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "refinery_page_translations", ["locale"], :name => "index_refinery_page_translations_on_locale"
  add_index "refinery_page_translations", ["refinery_page_id"], :name => "index_refinery_page_translations_on_refinery_page_id"

  create_table "refinery_pages", :force => true do |t|
    t.integer  "parent_id"
    t.string   "path"
    t.string   "slug"
    t.boolean  "show_in_menu",        :default => true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           :default => true
    t.boolean  "draft",               :default => false
    t.boolean  "skip_to_first_child", :default => false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "view_template"
    t.string   "layout_template"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "refinery_pages", ["depth"], :name => "index_refinery_pages_on_depth"
  add_index "refinery_pages", ["id"], :name => "index_refinery_pages_on_id"
  add_index "refinery_pages", ["lft"], :name => "index_refinery_pages_on_lft"
  add_index "refinery_pages", ["parent_id"], :name => "index_refinery_pages_on_parent_id"
  add_index "refinery_pages", ["rgt"], :name => "index_refinery_pages_on_rgt"

  create_table "refinery_resources", :force => true do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_uid"
    t.string   "file_ext"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "refinery_roles", :force => true do |t|
    t.string "title"
  end

  create_table "refinery_roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "refinery_roles_users", ["role_id", "user_id"], :name => "index_refinery_roles_users_on_role_id_and_user_id"
  add_index "refinery_roles_users", ["user_id", "role_id"], :name => "index_refinery_roles_users_on_user_id_and_role_id"

  create_table "refinery_services", :force => true do |t|
    t.string   "title"
    t.integer  "image_id"
    t.text     "content"
    t.integer  "position"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.boolean  "expanded",                    :default => false
    t.string   "short_content"
    t.string   "color",         :limit => 50
    t.string   "icon",          :limit => 30
  end

  create_table "refinery_shinetech_clients", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "logo_id"
    t.text     "comment"
    t.string   "commenter"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "refinery_staffs", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "number"
    t.string   "title"
    t.integer  "image_id"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "github_url"
    t.string   "linkedin_url"
    t.string   "twitter_url"
    t.string   "weibo_url"
    t.string   "tags",            :limit => 50,                 :array => true
    t.integer  "second_image_id"
    t.string   "facebook_url"
    t.string   "cv_url"
    t.integer  "quote"
    t.string   "signature"
    t.string   "google_plus_url"
    t.string   "qq_weibo_url"
    t.string   "instagram_url"
  end

  create_table "refinery_technologies", :force => true do |t|
    t.string   "title"
    t.integer  "image_id"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "tags",        :limit => 30,                 :array => true
    t.integer  "height"
  end

  create_table "refinery_user_plugins", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "refinery_user_plugins", ["name"], :name => "index_refinery_user_plugins_on_name"
  add_index "refinery_user_plugins", ["user_id", "name"], :name => "index_refinery_user_plugins_on_user_id_and_name", :unique => true

  create_table "refinery_users", :force => true do |t|
    t.string   "username",               :null => false
    t.string   "email",                  :null => false
    t.string   "encrypted_password",     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "nickname"
  end

  add_index "refinery_users", ["id"], :name => "index_refinery_users_on_id"

  create_table "seo_meta", :force => true do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "seo_meta", ["id"], :name => "index_seo_meta_on_id"
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], :name => "index_seo_meta_on_seo_meta_id_and_seo_meta_type"

end
