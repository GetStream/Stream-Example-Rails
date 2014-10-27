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

ActiveRecord::Schema.define(version: 20141027094212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "_user_profile_queue", id: false, force: true do |t|
    t.integer "user_id",          null: false
    t.integer "influence_count",  null: false
    t.integer "recent_influence", null: false
    t.float   "find_influence",   null: false
    t.float   "love_influence",   null: false
  end

  create_table "ads_take_over", force: true do |t|
    t.boolean  "is_active",                 null: false
    t.datetime "updated_at",                null: false
    t.datetime "created_at",                null: false
    t.datetime "start",                     null: false
    t.datetime "end",                       null: false
    t.string   "slug",          limit: 50
    t.string   "image",         limit: 200
    t.string   "url",           limit: 200
    t.string   "countries_txt", limit: 256
    t.text     "extra"
  end

  add_index "ads_take_over", ["slug"], name: "ads_take_over_slug", using: :btree
  add_index "ads_take_over", ["slug"], name: "ads_take_over_slug_like", using: :btree

  create_table "affiliate_affiliate", force: true do |t|
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.integer  "user_id",    null: false
    t.boolean  "is_active",  null: false
  end

  add_index "affiliate_affiliate", ["user_id"], name: "affiliate_affiliate_user_id", using: :btree

  create_table "affiliate_affiliate_deal", force: true do |t|
    t.datetime "updated_at",   null: false
    t.datetime "created_at",   null: false
    t.integer  "affiliate_id", null: false
    t.integer  "commission",   null: false
    t.date     "start_date",   null: false
    t.date     "end_date"
  end

  add_index "affiliate_affiliate_deal", ["affiliate_id"], name: "affiliate_affiliate_deal_affiliate_id", using: :btree

  create_table "affiliate_click_location", force: true do |t|
    t.datetime "updated_at",            null: false
    t.datetime "created_at",            null: false
    t.string   "slug",       limit: 30, null: false
  end

  add_index "affiliate_click_location", ["slug"], name: "affiliate_click_location_slug", using: :btree
  add_index "affiliate_click_location", ["slug"], name: "affiliate_click_location_slug_like", using: :btree

  create_table "affiliate_click_tracking", force: true do |t|
    t.datetime "updated_at",                     null: false
    t.datetime "created_at",                     null: false
    t.integer  "user_id"
    t.inet     "ip"
    t.string   "ip_country",           limit: 2
    t.integer  "site_id"
    t.text     "destination_url"
    t.text     "affiliate_url"
    t.integer  "affiliate_network_id"
    t.integer  "content_type_id"
    t.integer  "object_id"
    t.integer  "location_id"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.text     "referer"
    t.text     "last_page"
  end

  add_index "affiliate_click_tracking", ["affiliate_network_id"], name: "affiliate_click_tracking_affiliate_network_id", using: :btree
  add_index "affiliate_click_tracking", ["content_type_id"], name: "affiliate_click_tracking_content_type_id", using: :btree
  add_index "affiliate_click_tracking", ["location_id"], name: "affiliate_click_tracking_location_id", using: :btree
  add_index "affiliate_click_tracking", ["site_id"], name: "affiliate_click_tracking_site_id", using: :btree
  add_index "affiliate_click_tracking", ["user_id"], name: "affiliate_click_tracking_user_id", using: :btree

  create_table "affiliate_clickstats_country", force: true do |t|
    t.date    "reference_date",                                     null: false
    t.string  "country_id",      limit: 2
    t.integer "clicks",                                             null: false
    t.integer "monetized",                                          null: false
    t.decimal "commission",                precision: 12, scale: 5
    t.integer "transactions",                                       null: false
    t.integer "conversion_time",                                    null: false
  end

  add_index "affiliate_clickstats_country", ["country_id"], name: "affiliate_clickstats_country_country_id", using: :btree
  add_index "affiliate_clickstats_country", ["country_id"], name: "affiliate_clickstats_country_country_id_like", using: :btree
  add_index "affiliate_clickstats_country", ["reference_date", "country_id"], name: "affiliate_clickstats_country_reference_date_country_id_key", unique: true, using: :btree

  create_table "affiliate_clickstats_item", force: true do |t|
    t.date    "reference_date",                           null: false
    t.integer "item_id"
    t.integer "clicks",                                   null: false
    t.integer "monetized",                                null: false
    t.decimal "commission",      precision: 12, scale: 5
    t.integer "transactions",                             null: false
    t.integer "conversion_time",                          null: false
  end

  add_index "affiliate_clickstats_item", ["reference_date", "item_id"], name: "affiliate_clickstats_item_reference_date_item_id_key", unique: true, using: :btree

  create_table "affiliate_clickstats_site", force: true do |t|
    t.date    "reference_date",                           null: false
    t.integer "site_id",                                  null: false
    t.integer "clicks",                                   null: false
    t.integer "monetized",                                null: false
    t.decimal "commission",      precision: 12, scale: 5
    t.integer "transactions",                             null: false
    t.integer "conversion_time",                          null: false
  end

  add_index "affiliate_clickstats_site", ["reference_date", "site_id"], name: "affiliate_clickstats_site_reference_date_site_id_key", unique: true, using: :btree
  add_index "affiliate_clickstats_site", ["site_id"], name: "affiliate_clickstats_site_site_id", using: :btree

  create_table "affiliate_commision_junction_format", force: true do |t|
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.text     "format",     null: false
    t.string   "name",       null: false
  end

  create_table "affiliate_conversion_test", force: true do |t|
    t.datetime "updated_at",              null: false
    t.datetime "created_at",              null: false
    t.integer  "site_network_mapping_id"
    t.text     "url"
    t.text     "url_converted"
    t.datetime "checked_at"
    t.boolean  "working",                 null: false
    t.text     "last_url"
    t.boolean  "last_cookie",             null: false
    t.string   "cookie_name"
    t.string   "cookie_value"
    t.text     "url_after_check"
    t.boolean  "last_check",              null: false
    t.float    "match_percentage"
    t.float    "after_match_percentage"
    t.boolean  "automated",               null: false
  end

  add_index "affiliate_conversion_test", ["site_network_mapping_id"], name: "affiliate_conversion_test_site_network_mapping_id", using: :btree

  create_table "affiliate_currency", primary_key: "code", force: true do |t|
    t.string "name", limit: 50, null: false
  end

  add_index "affiliate_currency", ["code"], name: "affiliate_currency_code_like", using: :btree

  create_table "affiliate_data_feed_url", primary_key: "key", force: true do |t|
    t.datetime "updated_at",              null: false
    t.datetime "created_at",              null: false
    t.string   "url",        limit: 1024, null: false
    t.boolean  "active",                  null: false
  end

  add_index "affiliate_data_feed_url", ["key"], name: "affiliate_data_feed_url_key_like", using: :btree

  create_table "affiliate_deeplink_variable", force: true do |t|
    t.datetime "updated_at",  null: false
    t.datetime "created_at",  null: false
    t.string   "name",        null: false
    t.string   "slug",        null: false
    t.text     "description", null: false
  end

  add_index "affiliate_deeplink_variable", ["slug"], name: "affiliate_deeplink_variable_slug", using: :btree
  add_index "affiliate_deeplink_variable", ["slug"], name: "affiliate_deeplink_variable_slug_like", using: :btree

  create_table "affiliate_domain_geo_mapping", force: true do |t|
    t.datetime "updated_at",                    null: false
    t.datetime "created_at",                    null: false
    t.string   "slug",               limit: 40, null: false
    t.integer  "default_mapping_id",            null: false
  end

  add_index "affiliate_domain_geo_mapping", ["default_mapping_id"], name: "affiliate_domain_geo_mapping_default_mapping_id", using: :btree
  add_index "affiliate_domain_geo_mapping", ["slug"], name: "affiliate_domain_geo_mapping_slug_key", unique: true, using: :btree
  add_index "affiliate_domain_geo_mapping", ["slug"], name: "affiliate_domain_geo_mapping_slug_like", using: :btree

  create_table "affiliate_euroexchangerate", force: true do |t|
    t.string  "currency_id",  limit: 3,                          null: false
    t.date    "exchangedate",                                    null: false
    t.decimal "rate",                   precision: 10, scale: 5, null: false
  end

  add_index "affiliate_euroexchangerate", ["currency_id", "exchangedate"], name: "affiliate_euroexchangerate_currency_id_exchangedate_key", unique: true, using: :btree
  add_index "affiliate_euroexchangerate", ["currency_id"], name: "affiliate_euroexchangerate_currency_id", using: :btree
  add_index "affiliate_euroexchangerate", ["currency_id"], name: "affiliate_euroexchangerate_currency_id_like", using: :btree

  create_table "affiliate_mapping_affili_net", primary_key: "sitenetworkmapping_ptr_id", force: true do |t|
    t.string "country", null: false
    t.string "mid",     null: false
  end

  create_table "affiliate_mapping_commission_junction", primary_key: "sitenetworkmapping_ptr_id", force: true do |t|
    t.integer "format_id",                null: false
    t.integer "homepage_format_id",       null: false
    t.string  "homepage_foreign_site_id", null: false
  end

  add_index "affiliate_mapping_commission_junction", ["format_id"], name: "affiliate_mapping_commission_junction_format_id", using: :btree
  add_index "affiliate_mapping_commission_junction", ["homepage_format_id"], name: "affiliate_mapping_commission_junction_homepage_format_id", using: :btree

  create_table "affiliate_mapping_ebay", primary_key: "sitenetworkmapping_ptr_id", force: true do |t|
    t.string "country", limit: 50, null: false
  end

  create_table "affiliate_mapping_link_synergy", primary_key: "sitenetworkmapping_ptr_id", force: true do |t|
    t.string "homepage_id"
    t.string "mid"
  end

  create_table "affiliate_mapping_pepperjam", primary_key: "sitenetworkmapping_ptr_id", force: true do |t|
    t.string "mid", null: false
  end

  create_table "affiliate_mapping_share_a_sale", primary_key: "sitenetworkmapping_ptr_id", force: true do |t|
    t.string "banner_id",          null: false
    t.string "homepage_banner_id", null: false
  end

  create_table "affiliate_mapping_tradedoubler", primary_key: "sitenetworkmapping_ptr_id", force: true do |t|
    t.string "country", null: false
    t.string "mid",     null: false
  end

  create_table "affiliate_mapping_zanox_mapping", primary_key: "sitenetworkmapping_ptr_id", force: true do |t|
    t.string  "homepage_id",     null: false
    t.integer "deeplink_var_id"
    t.string  "extra_qp"
    t.boolean "brackets",        null: false
  end

  add_index "affiliate_mapping_zanox_mapping", ["deeplink_var_id"], name: "affiliate_mapping_zanox_mapping_deeplink_var_id", using: :btree

  create_table "affiliate_network", force: true do |t|
    t.datetime "updated_at",      null: false
    t.datetime "created_at",      null: false
    t.string   "name",            null: false
    t.string   "slug",            null: false
    t.string   "affiliate_id",    null: false
    t.text     "format"
    t.text     "homepage_format"
    t.string   "deeplink_qp"
    t.integer  "deeplink_var_id"
    t.string   "site_qp"
    t.string   "clickref_qp"
    t.integer  "content_type_id"
  end

  add_index "affiliate_network", ["content_type_id"], name: "affiliate_network_content_type_id", using: :btree
  add_index "affiliate_network", ["deeplink_var_id"], name: "affiliate_network_deeplink_var_id", using: :btree
  add_index "affiliate_network", ["slug"], name: "affiliate_network_slug", using: :btree
  add_index "affiliate_network", ["slug"], name: "affiliate_network_slug_like", using: :btree

  create_table "affiliate_site", force: true do |t|
    t.datetime "updated_at",      null: false
    t.datetime "created_at",      null: false
    t.string   "name",            null: false
    t.string   "domain",          null: false
    t.integer  "category"
    t.integer  "content_type_id"
    t.integer  "object_id"
  end

  add_index "affiliate_site", ["content_type_id"], name: "affiliate_site_content_type_id", using: :btree

  create_table "affiliate_site_geo_mapping", force: true do |t|
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.integer  "domain_id",  null: false
    t.integer  "mapping_id", null: false
  end

  add_index "affiliate_site_geo_mapping", ["domain_id"], name: "affiliate_site_geo_mapping_domain_id", using: :btree
  add_index "affiliate_site_geo_mapping", ["mapping_id"], name: "affiliate_site_geo_mapping_mapping_id", using: :btree

  create_table "affiliate_site_network_mapping", force: true do |t|
    t.datetime "updated_at",      null: false
    t.datetime "created_at",      null: false
    t.integer  "network_id",      null: false
    t.integer  "site_id",         null: false
    t.string   "program"
    t.integer  "order",           null: false
    t.text     "description"
    t.string   "foreign_site_id"
    t.boolean  "no_deeplinks",    null: false
    t.boolean  "is_active",       null: false
  end

  add_index "affiliate_site_network_mapping", ["network_id", "site_id", "program"], name: "affiliate_site_network_mapping_network_id_site_id_program_key", unique: true, using: :btree
  add_index "affiliate_site_network_mapping", ["network_id"], name: "affiliate_site_network_mapping_network_id", using: :btree
  add_index "affiliate_site_network_mapping", ["site_id"], name: "affiliate_site_network_mapping_site_id", using: :btree

  create_table "affiliate_sitegeomapping_countries", force: true do |t|
    t.integer "sitegeomapping_id",           null: false
    t.string  "country_id",        limit: 2, null: false
  end

  add_index "affiliate_sitegeomapping_countries", ["country_id"], name: "affiliate_sitegeomapping_countries_country_id", using: :btree
  add_index "affiliate_sitegeomapping_countries", ["country_id"], name: "affiliate_sitegeomapping_countries_country_id_like", using: :btree
  add_index "affiliate_sitegeomapping_countries", ["sitegeomapping_id", "country_id"], name: "affiliate_sitegeomapping_count_sitegeomapping_id_country_id_key", unique: true, using: :btree
  add_index "affiliate_sitegeomapping_countries", ["sitegeomapping_id"], name: "affiliate_sitegeomapping_countries_sitegeomapping_id", using: :btree

  create_table "affiliate_skip_monetization", force: true do |t|
    t.datetime "updated_at",             null: false
    t.datetime "created_at",             null: false
    t.integer  "site_id",                null: false
    t.boolean  "is_active",              null: false
    t.string   "extra_query_parameters"
  end

  add_index "affiliate_skip_monetization", ["site_id"], name: "affiliate_skip_monetization_site_id_key", unique: true, using: :btree

  create_table "affiliate_transaction", force: true do |t|
    t.datetime "updated_at",                                                 null: false
    t.datetime "created_at",                                                 null: false
    t.integer  "network_id",                                                 null: false
    t.string   "transaction_id",                                             null: false
    t.integer  "click_id"
    t.string   "merchant"
    t.string   "program"
    t.string   "link_id"
    t.string   "network_click_id"
    t.string   "clickref"
    t.integer  "sales"
    t.decimal  "sales_euro",                        precision: 12, scale: 5
    t.integer  "commission",                                                 null: false
    t.string   "currency",               limit: 50,                          null: false
    t.string   "commission_currency_id", limit: 3
    t.decimal  "commission_euro",                   precision: 12, scale: 5
    t.integer  "status",                 limit: 2,                           null: false
    t.datetime "ordered_at",                                                 null: false
    t.datetime "accepted_at"
  end

  add_index "affiliate_transaction", ["click_id"], name: "affiliate_transaction_click_id", using: :btree
  add_index "affiliate_transaction", ["commission_currency_id"], name: "affiliate_transaction_commission_currency_id", using: :btree
  add_index "affiliate_transaction", ["commission_currency_id"], name: "affiliate_transaction_commission_currency_id_like", using: :btree
  add_index "affiliate_transaction", ["network_id", "transaction_id"], name: "affiliate_transaction_network_id_transaction_id_key", unique: true, using: :btree
  add_index "affiliate_transaction", ["network_id"], name: "affiliate_transaction_network_id", using: :btree

  create_table "api_api_partner", force: true do |t|
    t.datetime "updated_at",                  null: false
    t.datetime "created_at",                  null: false
    t.string   "name",                        null: false
    t.string   "api_key",          limit: 30, null: false
    t.string   "private_key",      limit: 30, null: false
    t.boolean  "is_active",                   null: false
    t.string   "default_location", limit: 50
  end

  add_index "api_api_partner", ["api_key"], name: "api_api_partner_api_key_key", unique: true, using: :btree
  add_index "api_api_partner", ["api_key"], name: "api_api_partner_api_key_like", using: :btree

  create_table "auth_group", force: true do |t|
    t.string "name", limit: 80, null: false
  end

  add_index "auth_group", ["name"], name: "auth_group_name_key", unique: true, using: :btree
  add_index "auth_group", ["name"], name: "auth_group_name_like", using: :btree

  create_table "auth_group_permissions", force: true do |t|
    t.integer "group_id",      null: false
    t.integer "permission_id", null: false
  end

  add_index "auth_group_permissions", ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_key", unique: true, using: :btree
  add_index "auth_group_permissions", ["group_id"], name: "auth_group_permissions_group_id", using: :btree
  add_index "auth_group_permissions", ["permission_id"], name: "auth_group_permissions_permission_id", using: :btree

  create_table "auth_permission", force: true do |t|
    t.string  "name",            limit: 50,  null: false
    t.integer "content_type_id",             null: false
    t.string  "codename",        limit: 100, null: false
  end

  add_index "auth_permission", ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_key", unique: true, using: :btree
  add_index "auth_permission", ["content_type_id"], name: "auth_permission_content_type_id", using: :btree

  create_table "auth_user", force: true do |t|
    t.string   "password",                limit: 128, null: false
    t.datetime "last_login",                          null: false
    t.boolean  "is_superuser",                        null: false
    t.string   "username",                limit: 30,  null: false
    t.string   "first_name",              limit: 30,  null: false
    t.string   "last_name",               limit: 30,  null: false
    t.string   "email",                   limit: 75,  null: false
    t.boolean  "is_staff",                            null: false
    t.boolean  "is_active",                           null: false
    t.datetime "date_joined",                         null: false
    t.inet     "registration_ip",                     null: false
    t.string   "registration_ip_country", limit: 2
    t.inet     "last_login_ip",                       null: false
    t.string   "last_login_ip_country",   limit: 2
    t.string   "entity_locale",           limit: 10
    t.string   "locale",                  limit: 10
    t.boolean  "cdn_disabled",                        null: false
    t.boolean  "show_name",                           null: false
    t.integer  "allow_messages_from",                 null: false
  end

  add_index "auth_user", ["email"], name: "auth_user_email_key", unique: true, using: :btree
  add_index "auth_user", ["email"], name: "auth_user_email_like", using: :btree
  add_index "auth_user", ["username"], name: "auth_user_username_key", unique: true, using: :btree
  add_index "auth_user", ["username"], name: "auth_user_username_like", using: :btree

  create_table "auth_user_groups", force: true do |t|
    t.integer "user_id",  null: false
    t.integer "group_id", null: false
  end

  add_index "auth_user_groups", ["group_id"], name: "auth_user_groups_group_id", using: :btree
  add_index "auth_user_groups", ["user_id", "group_id"], name: "auth_user_groups_user_id_group_id_key", unique: true, using: :btree
  add_index "auth_user_groups", ["user_id"], name: "auth_user_groups_user_id", using: :btree

  create_table "auth_user_user_permissions", force: true do |t|
    t.integer "user_id",       null: false
    t.integer "permission_id", null: false
  end

  add_index "auth_user_user_permissions", ["permission_id"], name: "auth_user_user_permissions_permission_id", using: :btree
  add_index "auth_user_user_permissions", ["user_id", "permission_id"], name: "auth_user_user_permissions_user_id_permission_id_key", unique: true, using: :btree
  add_index "auth_user_user_permissions", ["user_id"], name: "auth_user_user_permissions_user_id", using: :btree

  create_table "celery_taskmeta", force: true do |t|
    t.string   "task_id",              null: false
    t.string   "status",    limit: 50, null: false
    t.text     "result"
    t.datetime "date_done",            null: false
    t.text     "traceback"
    t.boolean  "hidden",               null: false
    t.text     "meta"
  end

  add_index "celery_taskmeta", ["hidden"], name: "celery_taskmeta_hidden", using: :btree
  add_index "celery_taskmeta", ["task_id"], name: "celery_taskmeta_task_id_key", unique: true, using: :btree
  add_index "celery_taskmeta", ["task_id"], name: "celery_taskmeta_task_id_like", using: :btree

  create_table "celery_tasksetmeta", force: true do |t|
    t.string   "taskset_id", null: false
    t.text     "result",     null: false
    t.datetime "date_done",  null: false
    t.boolean  "hidden",     null: false
  end

  add_index "celery_tasksetmeta", ["hidden"], name: "celery_tasksetmeta_hidden", using: :btree
  add_index "celery_tasksetmeta", ["taskset_id"], name: "celery_tasksetmeta_taskset_id_key", unique: true, using: :btree
  add_index "celery_tasksetmeta", ["taskset_id"], name: "celery_tasksetmeta_taskset_id_like", using: :btree

  create_table "classolista_audience", force: true do |t|
    t.string "name",        null: false
    t.string "slug",        null: false
    t.text   "description", null: false
  end

  add_index "classolista_audience", ["slug"], name: "classolista_audience_slug", using: :btree
  add_index "classolista_audience", ["slug"], name: "classolista_audience_slug_like", using: :btree

  create_table "classolista_audiencemember", force: true do |t|
    t.integer "audience_id", null: false
    t.integer "user_id",     null: false
  end

  add_index "classolista_audiencemember", ["audience_id"], name: "classolista_audiencemember_audience_id", using: :btree
  add_index "classolista_audiencemember", ["user_id"], name: "classolista_audiencemember_user_id", using: :btree

  create_table "classolista_churn", force: true do |t|
    t.date    "reference_date",      null: false
    t.date    "registration_cohort", null: false
    t.integer "size",                null: false
  end

  add_index "classolista_churn", ["reference_date", "registration_cohort"], name: "classolista_churn_reference_date_registration_cohort_key", unique: true, using: :btree

  create_table "classolista_dailystats", force: true do |t|
    t.date    "reference_date",            null: false
    t.integer "logins",                    null: false
    t.integer "registrations",             null: false
    t.integer "registrations_cpc",         null: false
    t.integer "registrations_widget",      null: false
    t.integer "registrations_facebook",    null: false
    t.integer "loves",                     null: false
    t.integer "loves_products",            null: false
    t.integer "loves_looks",               null: false
    t.integer "users_loving",              null: false
    t.integer "finds",                     null: false
    t.integer "finds_products",            null: false
    t.integer "finds_looks",               null: false
    t.integer "users_finding",             null: false
    t.integer "follows",                   null: false
    t.integer "users_following",           null: false
    t.integer "users_followed",            null: false
    t.integer "clicks",                    null: false
    t.integer "monetized_clicks",          null: false
    t.integer "lists_created",             null: false
    t.integer "list_items_added",          null: false
    t.integer "list_items_added_products", null: false
    t.integer "list_items_added_looks",    null: false
    t.integer "comments_profiles",         null: false
    t.integer "comments_items",            null: false
    t.integer "comments_lists",            null: false
    t.integer "comments_spam",             null: false
  end

  add_index "classolista_dailystats", ["reference_date"], name: "classolista_dailystats_reference_date_key", unique: true, using: :btree

  create_table "classolista_dailyuserstats", force: true do |t|
    t.date    "reference_date", null: false
    t.integer "group_id",       null: false
    t.integer "count",          null: false
  end

  add_index "classolista_dailyuserstats", ["group_id"], name: "classolista_dailyuserstats_group_id", using: :btree
  add_index "classolista_dailyuserstats", ["reference_date", "group_id"], name: "classolista_dailyuserstats_reference_date_group_id_key", unique: true, using: :btree

  create_table "classolista_find_stat", force: true do |t|
    t.integer "entity_id",        null: false
    t.integer "created_by_id",    null: false
    t.date    "created_at",       null: false
    t.integer "loves",            null: false
    t.integer "recent_followers", null: false
  end

  add_index "classolista_find_stat", ["created_at"], name: "classolista_find_stat_created_at", using: :btree
  add_index "classolista_find_stat", ["created_by_id"], name: "classolista_find_stat_created_by_id", using: :btree
  add_index "classolista_find_stat", ["entity_id"], name: "classolista_find_stat_entity_id_key", unique: true, using: :btree

  create_table "classolista_group", force: true do |t|
    t.integer "ruleorder",              null: false
    t.string  "name",        limit: 50, null: false
    t.string  "description",            null: false
  end

  add_index "classolista_group", ["ruleorder"], name: "classolista_group_ruleorder_key", unique: true, using: :btree

  create_table "classolista_growthstats", force: true do |t|
    t.date    "reference_date",         null: false
    t.integer "total_active",           null: false
    t.integer "total_active_cpc",       null: false
    t.integer "new_active_users",       null: false
    t.integer "new_active_users_cpc",   null: false
    t.integer "new_inactive_users",     null: false
    t.integer "new_inactive_users_cpc", null: false
    t.integer "activated",              null: false
    t.integer "activated_cpc",          null: false
    t.integer "phoenixes",              null: false
    t.integer "phoenixes_cpc",          null: false
    t.integer "zombies",                null: false
    t.integer "zombies_cpc",            null: false
    t.integer "deactivated",            null: false
    t.integer "deactivated_cpc",        null: false
  end

  add_index "classolista_growthstats", ["reference_date"], name: "classolista_growthstats_reference_date_key", unique: true, using: :btree

  create_table "classolista_heartbeatstats", force: true do |t|
    t.datetime "reference_time",         null: false
    t.integer  "logins",                 null: false
    t.integer  "registrations",          null: false
    t.integer  "registrations_facebook", null: false
    t.integer  "loves",                  null: false
    t.integer  "finds",                  null: false
    t.integer  "follows",                null: false
  end

  add_index "classolista_heartbeatstats", ["reference_time"], name: "classolista_heartbeatstats_reference_time_key", unique: true, using: :btree

  create_table "classolista_lovestats", force: true do |t|
    t.integer "love_id", null: false
    t.date    "date",    null: false
  end

  add_index "classolista_lovestats", ["date"], name: "classolista_lovestats_date", using: :btree
  add_index "classolista_lovestats", ["love_id"], name: "classolista_lovestats_love_id", using: :btree

  create_table "classolista_periodicstats", force: true do |t|
    t.date    "reference_date",                      null: false
    t.string  "interval",                  limit: 5, null: false
    t.integer "logins",                              null: false
    t.integer "users_loggingin",                     null: false
    t.integer "registrations",                       null: false
    t.integer "registrations_cpc",                   null: false
    t.integer "registrations_widget",                null: false
    t.integer "registrations_facebook",              null: false
    t.integer "loves",                               null: false
    t.integer "loves_products",                      null: false
    t.integer "loves_looks",                         null: false
    t.integer "users_loving",                        null: false
    t.integer "finds",                               null: false
    t.integer "finds_products",                      null: false
    t.integer "finds_looks",                         null: false
    t.integer "users_finding",                       null: false
    t.integer "follows",                             null: false
    t.integer "users_following",                     null: false
    t.integer "users_followed",                      null: false
    t.integer "clicks",                              null: false
    t.integer "monetized_clicks",                    null: false
    t.integer "lists_created",                       null: false
    t.integer "list_items_added",                    null: false
    t.integer "list_items_added_products",           null: false
    t.integer "list_items_added_looks",              null: false
    t.integer "comments_profiles",                   null: false
    t.integer "comments_items",                      null: false
    t.integer "comments_lists",                      null: false
    t.integer "comments_spam",                       null: false
  end

  add_index "classolista_periodicstats", ["reference_date", "interval"], name: "classolista_periodicstats_reference_date_interval_key", unique: true, using: :btree
  add_index "classolista_periodicstats", ["reference_date"], name: "classolista_periodicstats_reference_date", using: :btree

  create_table "classolista_rule", force: true do |t|
    t.integer "ruleset_id",            null: false
    t.string  "variable",   limit: 50, null: false
    t.string  "operator",   limit: 2,  null: false
    t.integer "value",                 null: false
  end

  add_index "classolista_rule", ["ruleset_id"], name: "classolista_rule_ruleset_id", using: :btree

  create_table "classolista_ruleset", force: true do |t|
    t.integer "group_id", null: false
    t.boolean "match",    null: false
  end

  add_index "classolista_ruleset", ["group_id"], name: "classolista_ruleset_group_id", using: :btree

  create_table "classolista_userstats", force: true do |t|
    t.integer "user_id",             null: false
    t.date    "reference_date",      null: false
    t.integer "registered_days_ago", null: false
    t.integer "last_login_days_ago", null: false
    t.integer "group_id",            null: false
    t.integer "recent_logins",       null: false
    t.integer "recent_loves",        null: false
    t.integer "recent_finds",        null: false
    t.integer "recent_following",    null: false
    t.integer "recent_followed",     null: false
  end

  add_index "classolista_userstats", ["group_id"], name: "classolista_userstats_group_id", using: :btree
  add_index "classolista_userstats", ["reference_date"], name: "classolista_userstats_reference_date", using: :btree
  add_index "classolista_userstats", ["user_id", "reference_date"], name: "classolista_userstats_user_id_reference_date_key", unique: true, using: :btree
  add_index "classolista_userstats", ["user_id"], name: "classolista_userstats_user_id", using: :btree

  create_table "content_contentpage", force: true do |t|
    t.string   "title",      limit: 128, null: false
    t.string   "slug",       limit: 128, null: false
    t.text     "content",                null: false
    t.boolean  "translate",              null: false
    t.boolean  "guide",                  null: false
    t.boolean  "bare",                   null: false
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "content_contentpage", ["slug"], name: "content_contentpage_slug", using: :btree
  add_index "content_contentpage", ["slug"], name: "content_contentpage_slug_like", using: :btree

  create_table "content_highlight", force: true do |t|
    t.boolean  "is_active",                null: false
    t.datetime "updated_at",               null: false
    t.datetime "created_at",               null: false
    t.integer  "type_id",                  null: false
    t.string   "title",        limit: 128, null: false
    t.text     "text",                     null: false
    t.text     "link",                     null: false
    t.datetime "published_at",             null: false
    t.integer  "width"
    t.integer  "height"
    t.string   "image",        limit: 100
  end

  add_index "content_highlight", ["type_id"], name: "content_highlight_type_id", using: :btree

  create_table "content_highlight_type", force: true do |t|
    t.datetime "updated_at",             null: false
    t.datetime "created_at",             null: false
    t.string   "title",      limit: 128, null: false
    t.string   "slug",       limit: 128, null: false
  end

  add_index "content_highlight_type", ["slug"], name: "content_highlight_type_slug", using: :btree
  add_index "content_highlight_type", ["slug"], name: "content_highlight_type_slug_like", using: :btree

  create_table "contest_contest", force: true do |t|
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.string   "name",                                 null: false
    t.string   "slug",                     limit: 50,  null: false
    t.text     "description"
    t.text     "list_intro_text"
    t.text     "rules"
    t.text     "sidebar"
    t.text     "thankyou_text"
    t.datetime "start",                                null: false
    t.datetime "end",                                  null: false
    t.string   "template_file"
    t.boolean  "show_on_homepage",                     null: false
    t.boolean  "is_active",                            null: false
    t.boolean  "is_give_away",                         null: false
    t.boolean  "is_blogger_battle",                    null: false
    t.integer  "item_id"
    t.integer  "user_list_id"
    t.string   "user_list_name"
    t.boolean  "must_love_item",                       null: false
    t.text     "og_description"
    t.string   "og_image",                 limit: 100
    t.string   "partner_name"
    t.integer  "partner_user_id"
    t.text     "partner_description"
    t.string   "partner_url",              limit: 200
    t.string   "partner_logo",             limit: 100
    t.string   "partner_logo_position",    limit: 2,   null: false
    t.string   "partner_look_logo",        limit: 100
    t.string   "overview_image",           limit: 100
    t.boolean  "must_follow_partner_user",             null: false
    t.boolean  "must_like_partner_link",               null: false
    t.integer  "must_pick_favorites",                  null: false
    t.boolean  "is_opt_in",                            null: false
    t.boolean  "must_join_mailinglist",                null: false
    t.text     "mail_opt_in_description"
    t.boolean  "is_multi_vote",                        null: false
    t.integer  "max_votes",                            null: false
    t.text     "twitter_text"
    t.text     "facebook_text"
    t.text     "additional_info"
    t.integer  "overview_ordering"
    t.string   "header_image",             limit: 100
    t.string   "list_header_image",        limit: 100
  end

  add_index "contest_contest", ["item_id"], name: "contest_contest_item_id", using: :btree
  add_index "contest_contest", ["partner_user_id"], name: "contest_contest_partner_user_id", using: :btree
  add_index "contest_contest", ["slug"], name: "contest_contest_slug_key", unique: true, using: :btree
  add_index "contest_contest", ["slug"], name: "contest_contest_slug_like", using: :btree
  add_index "contest_contest", ["user_list_id"], name: "contest_contest_user_list_id", using: :btree

  create_table "contest_contest_blogger_battle_looks", force: true do |t|
    t.integer "contest_id",  null: false
    t.integer "userlist_id", null: false
  end

  add_index "contest_contest_blogger_battle_looks", ["contest_id", "userlist_id"], name: "contest_contest_blogger_battle_looks_contest_id_userlist_id_key", unique: true, using: :btree
  add_index "contest_contest_blogger_battle_looks", ["contest_id"], name: "contest_contest_blogger_battle_looks_contest_id", using: :btree
  add_index "contest_contest_blogger_battle_looks", ["userlist_id"], name: "contest_contest_blogger_battle_looks_userlist_id", using: :btree

  create_table "contest_contest_blogger_battle_winners", force: true do |t|
    t.integer "contest_id",  null: false
    t.integer "userlist_id", null: false
  end

  add_index "contest_contest_blogger_battle_winners", ["contest_id", "userlist_id"], name: "contest_contest_blogger_battle_winne_contest_id_userlist_id_key", unique: true, using: :btree
  add_index "contest_contest_blogger_battle_winners", ["contest_id"], name: "contest_contest_blogger_battle_winners_contest_id", using: :btree
  add_index "contest_contest_blogger_battle_winners", ["userlist_id"], name: "contest_contest_blogger_battle_winners_userlist_id", using: :btree

  create_table "contest_dynamic_contest", force: true do |t|
    t.datetime "updated_at",                            null: false
    t.datetime "created_at",                            null: false
    t.string   "name",                      limit: 256
    t.string   "slug",                      limit: 50,  null: false
    t.text     "slogan"
    t.text     "description"
    t.text     "additional_info"
    t.text     "rules"
    t.boolean  "is_active",                             null: false
    t.datetime "start",                                 null: false
    t.datetime "end",                                   null: false
    t.integer  "max_votes"
    t.string   "vote_or_look",              limit: 1,   null: false
    t.string   "user_list_name"
    t.string   "list_header_image",         limit: 100
    t.string   "partner_name"
    t.boolean  "must_follow_partner_user",              null: false
    t.integer  "partner_user_id"
    t.text     "partner_description"
    t.string   "partner_url",               limit: 200
    t.string   "partner_logo",              limit: 100
    t.string   "partner_logo_position",     limit: 2,   null: false
    t.string   "partner_look_logo",         limit: 100
    t.string   "template_file"
    t.string   "header_image",              limit: 100
    t.integer  "overview_ordering"
    t.string   "overview_image",            limit: 100
    t.text     "og_description"
    t.string   "og_image",                  limit: 100
    t.text     "twitter_text"
    t.string   "facebook_page",             limit: 200
    t.text     "facebook_text"
    t.text     "facebook_invite_hook_text"
    t.boolean  "redirect_on_finish",                    null: false
    t.string   "redirect_url",              limit: 200
    t.text     "cta_text"
    t.text     "button_text"
  end

  add_index "contest_dynamic_contest", ["partner_user_id"], name: "contest_dynamic_contest_partner_user_id", using: :btree
  add_index "contest_dynamic_contest", ["slug"], name: "contest_dynamic_contest_slug_key", unique: true, using: :btree
  add_index "contest_dynamic_contest", ["slug"], name: "contest_dynamic_contest_slug_like", using: :btree

  create_table "contest_dynamiccontest_looks", force: true do |t|
    t.integer "dynamiccontest_id", null: false
    t.integer "userlist_id",       null: false
  end

  add_index "contest_dynamiccontest_looks", ["dynamiccontest_id", "userlist_id"], name: "contest_dynamiccontest_looks_dynamiccontest_id_userlist_id_key", unique: true, using: :btree
  add_index "contest_dynamiccontest_looks", ["dynamiccontest_id"], name: "contest_dynamiccontest_looks_dynamiccontest_id", using: :btree
  add_index "contest_dynamiccontest_looks", ["userlist_id"], name: "contest_dynamiccontest_looks_userlist_id", using: :btree

  create_table "contest_dynamiccontest_looks_winners", force: true do |t|
    t.integer "dynamiccontest_id", null: false
    t.integer "userlist_id",       null: false
  end

  add_index "contest_dynamiccontest_looks_winners", ["dynamiccontest_id", "userlist_id"], name: "contest_dynamiccontest_looks__dynamiccontest_id_userlist_id_key", unique: true, using: :btree
  add_index "contest_dynamiccontest_looks_winners", ["dynamiccontest_id"], name: "contest_dynamiccontest_looks_winners_dynamiccontest_id", using: :btree
  add_index "contest_dynamiccontest_looks_winners", ["userlist_id"], name: "contest_dynamiccontest_looks_winners_userlist_id", using: :btree

  create_table "contest_entrant", force: true do |t|
    t.integer  "user_id",              null: false
    t.integer  "contest_id"
    t.integer  "dynamic_contest_id"
    t.integer  "iframe_contest_id"
    t.boolean  "winner",               null: false
    t.boolean  "sent_mail",            null: false
    t.boolean  "mail_opt_in",          null: false
    t.integer  "vote_content_type_id"
    t.integer  "vote_object_id"
    t.datetime "created_at"
    t.inet     "voter_ip"
    t.text     "voter_user_agent"
    t.text     "voter_user_referer"
    t.integer  "step"
  end

  add_index "contest_entrant", ["contest_id"], name: "contest_entrant_contest_id", using: :btree
  add_index "contest_entrant", ["dynamic_contest_id"], name: "contest_entrant_dynamic_contest_id", using: :btree
  add_index "contest_entrant", ["iframe_contest_id"], name: "contest_entrant_iframe_contest_id", using: :btree
  add_index "contest_entrant", ["user_id", "contest_id", "vote_content_type_id", "vote_object_id"], name: "contest_entrant_user_id_contest_id_vote_content_type_id_vot_key", unique: true, using: :btree
  add_index "contest_entrant", ["user_id"], name: "contest_entrant_user_id", using: :btree
  add_index "contest_entrant", ["vote_content_type_id"], name: "contest_entrant_vote_content_type_id", using: :btree

  create_table "contest_event_special", force: true do |t|
    t.datetime "updated_at",                       null: false
    t.datetime "created_at",                       null: false
    t.integer  "profile_id",                       null: false
    t.string   "name",                             null: false
    t.text     "description"
    t.boolean  "is_active",                        null: false
    t.text     "stay_tuned_text"
    t.string   "tab_order"
    t.string   "countries"
    t.text     "social_embed"
    t.string   "partner_logo",         limit: 100
    t.string   "partner_name"
    t.string   "partner_logo_overlay", limit: 100
    t.string   "partner_url",          limit: 200
    t.string   "blogger_name",                     null: false
    t.text     "blogger_description"
    t.string   "blogger_url",          limit: 200
    t.string   "blogger_photo",        limit: 100
    t.string   "overview_image",       limit: 100
    t.integer  "featured_items_id"
  end

  add_index "contest_event_special", ["featured_items_id"], name: "contest_event_special_featured_items_id", using: :btree
  add_index "contest_event_special", ["profile_id"], name: "contest_event_special_profile_id", using: :btree

  create_table "contest_event_special_blog", force: true do |t|
    t.datetime "updated_at",                 null: false
    t.datetime "created_at",                 null: false
    t.integer  "event_special_id",           null: false
    t.string   "name",                       null: false
    t.text     "content"
    t.integer  "user_id"
    t.string   "location",         limit: 3
    t.datetime "date",                       null: false
    t.boolean  "is_active",                  null: false
  end

  add_index "contest_event_special_blog", ["event_special_id"], name: "contest_event_special_blog_event_special_id", using: :btree
  add_index "contest_event_special_blog", ["user_id"], name: "contest_event_special_blog_user_id", using: :btree

  create_table "contest_event_special_look", force: true do |t|
    t.datetime "updated_at",                 null: false
    t.datetime "created_at",                 null: false
    t.integer  "event_special_id",           null: false
    t.string   "name",                       null: false
    t.text     "description"
    t.integer  "user_id"
    t.string   "location",         limit: 3
    t.integer  "look_id",                    null: false
    t.datetime "date",                       null: false
    t.boolean  "is_active",                  null: false
  end

  add_index "contest_event_special_look", ["event_special_id"], name: "contest_event_special_look_event_special_id", using: :btree
  add_index "contest_event_special_look", ["look_id"], name: "contest_event_special_look_look_id", using: :btree
  add_index "contest_event_special_look", ["user_id"], name: "contest_event_special_look_user_id", using: :btree

  create_table "contest_event_special_photo", force: true do |t|
    t.datetime "updated_at",                   null: false
    t.datetime "created_at",                   null: false
    t.integer  "event_special_id",             null: false
    t.string   "name",                         null: false
    t.text     "description"
    t.text     "photo_url"
    t.string   "photo",            limit: 100
    t.integer  "look_id"
    t.integer  "user_id"
    t.string   "location",         limit: 3
    t.datetime "date",                         null: false
    t.boolean  "is_active",                    null: false
  end

  add_index "contest_event_special_photo", ["event_special_id"], name: "contest_event_special_photo_event_special_id", using: :btree
  add_index "contest_event_special_photo", ["look_id"], name: "contest_event_special_photo_look_id", using: :btree
  add_index "contest_event_special_photo", ["user_id"], name: "contest_event_special_photo_user_id", using: :btree

  create_table "contest_event_special_video", force: true do |t|
    t.datetime "updated_at",                 null: false
    t.datetime "created_at",                 null: false
    t.integer  "event_special_id",           null: false
    t.string   "name",                       null: false
    t.text     "youtube_video"
    t.text     "description"
    t.integer  "look_id"
    t.integer  "user_id"
    t.string   "location",         limit: 3
    t.datetime "date",                       null: false
    t.boolean  "is_active",                  null: false
  end

  add_index "contest_event_special_video", ["event_special_id"], name: "contest_event_special_video_event_special_id", using: :btree
  add_index "contest_event_special_video", ["look_id"], name: "contest_event_special_video_look_id", using: :btree
  add_index "contest_event_special_video", ["user_id"], name: "contest_event_special_video_user_id", using: :btree

  create_table "contest_i_frame_contest", force: true do |t|
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.string   "name",                                 null: false
    t.string   "slug",                     limit: 50,  null: false
    t.text     "slogan"
    t.text     "description"
    t.text     "additional_info"
    t.text     "rules"
    t.boolean  "is_active",                            null: false
    t.datetime "start",                                null: false
    t.datetime "end",                                  null: false
    t.integer  "overview_ordering"
    t.string   "start_url",                limit: 200
    t.string   "base_url",                 limit: 200
    t.string   "user_list_name"
    t.integer  "selection_size"
    t.string   "list_header_image",        limit: 100
    t.string   "partner_name"
    t.boolean  "must_follow_partner_user",             null: false
    t.integer  "partner_user_id"
    t.text     "partner_description"
    t.string   "partner_url",              limit: 200
    t.string   "partner_logo",             limit: 100
    t.string   "partner_logo_position",    limit: 2,   null: false
    t.string   "partner_look_logo",        limit: 100
    t.string   "overview_image",           limit: 100
    t.string   "header_image",             limit: 100
    t.text     "og_description"
    t.string   "og_image",                 limit: 100
    t.text     "twitter_text"
    t.string   "facebook_page",            limit: 200
    t.text     "facebook_text"
  end

  add_index "contest_i_frame_contest", ["partner_user_id"], name: "contest_i_frame_contest_partner_user_id", using: :btree
  add_index "contest_i_frame_contest", ["slug"], name: "contest_i_frame_contest_slug_key", unique: true, using: :btree
  add_index "contest_i_frame_contest", ["slug"], name: "contest_i_frame_contest_slug_like", using: :btree

  create_table "contest_iframecontest_looks", force: true do |t|
    t.integer "iframecontest_id", null: false
    t.integer "userlist_id",      null: false
  end

  add_index "contest_iframecontest_looks", ["iframecontest_id", "userlist_id"], name: "contest_iframecontest_looks_iframecontest_id_userlist_id_key", unique: true, using: :btree
  add_index "contest_iframecontest_looks", ["iframecontest_id"], name: "contest_iframecontest_looks_iframecontest_id", using: :btree
  add_index "contest_iframecontest_looks", ["userlist_id"], name: "contest_iframecontest_looks_userlist_id", using: :btree

  create_table "contest_iframecontest_looks_winners", force: true do |t|
    t.integer "iframecontest_id", null: false
    t.integer "userlist_id",      null: false
  end

  add_index "contest_iframecontest_looks_winners", ["iframecontest_id", "userlist_id"], name: "contest_iframecontest_looks_wi_iframecontest_id_userlist_id_key", unique: true, using: :btree
  add_index "contest_iframecontest_looks_winners", ["iframecontest_id"], name: "contest_iframecontest_looks_winners_iframecontest_id", using: :btree
  add_index "contest_iframecontest_looks_winners", ["userlist_id"], name: "contest_iframecontest_looks_winners_userlist_id", using: :btree

  create_table "contest_partnerlink", force: true do |t|
    t.integer "contest_id",             null: false
    t.string  "country",    limit: 2
    t.string  "url",        limit: 200
  end

  add_index "contest_partnerlink", ["contest_id"], name: "contest_partnerlink_contest_id", using: :btree

  create_table "contest_promotion", force: true do |t|
    t.boolean  "is_active",               null: false
    t.datetime "updated_at",              null: false
    t.datetime "created_at",              null: false
    t.string   "title",       limit: 256
    t.datetime "start",                   null: false
    t.datetime "end",                     null: false
    t.string   "image",       limit: 100
    t.string   "url",         limit: 200
    t.text     "description"
  end

  create_table "contest_style_contest_step", force: true do |t|
    t.datetime "updated_at",                     null: false
    t.datetime "created_at",                     null: false
    t.integer  "dynamic_contest_id",             null: false
    t.string   "name",               limit: 256
    t.integer  "user_list_id",                   null: false
    t.integer  "selection_size"
    t.integer  "order"
  end

  add_index "contest_style_contest_step", ["dynamic_contest_id"], name: "contest_style_contest_step_dynamic_contest_id", using: :btree
  add_index "contest_style_contest_step", ["user_list_id"], name: "contest_style_contest_step_user_list_id", using: :btree

  create_table "countries_country", primary_key: "iso", force: true do |t|
    t.string  "name_official", limit: 128, null: false
    t.string  "name",          limit: 128, null: false
    t.integer "sort_priority",             null: false
  end

  add_index "countries_country", ["iso"], name: "countries_country_iso_like", using: :btree

  create_table "django_admin_log", force: true do |t|
    t.datetime "action_time",                 null: false
    t.integer  "user_id",                     null: false
    t.integer  "content_type_id"
    t.text     "object_id"
    t.string   "object_repr",     limit: 200, null: false
    t.integer  "action_flag",     limit: 2,   null: false
    t.text     "change_message",              null: false
  end

  add_index "django_admin_log", ["content_type_id"], name: "django_admin_log_content_type_id", using: :btree
  add_index "django_admin_log", ["user_id"], name: "django_admin_log_user_id", using: :btree

  create_table "django_comment_flags", force: true do |t|
    t.integer  "user_id",               null: false
    t.integer  "comment_id",            null: false
    t.string   "flag",       limit: 30, null: false
    t.datetime "flag_date",             null: false
  end

  add_index "django_comment_flags", ["comment_id"], name: "django_comment_flags_comment_id", using: :btree
  add_index "django_comment_flags", ["flag"], name: "django_comment_flags_flag", using: :btree
  add_index "django_comment_flags", ["flag"], name: "django_comment_flags_flag_like", using: :btree
  add_index "django_comment_flags", ["user_id", "comment_id", "flag"], name: "django_comment_flags_user_id_comment_id_flag_key", unique: true, using: :btree
  add_index "django_comment_flags", ["user_id"], name: "django_comment_flags_user_id", using: :btree

  create_table "django_comments", force: true do |t|
    t.integer  "content_type_id",             null: false
    t.text     "object_pk",                   null: false
    t.integer  "site_id",                     null: false
    t.integer  "user_id"
    t.string   "user_name",       limit: 50,  null: false
    t.string   "user_email",      limit: 75,  null: false
    t.string   "user_url",        limit: 200, null: false
    t.text     "comment",                     null: false
    t.datetime "submit_date",                 null: false
    t.inet     "ip_address"
    t.boolean  "is_public",                   null: false
    t.boolean  "is_removed",                  null: false
  end

  add_index "django_comments", ["content_type_id"], name: "django_comments_content_type_id", using: :btree
  add_index "django_comments", ["site_id"], name: "django_comments_site_id", using: :btree
  add_index "django_comments", ["user_id"], name: "django_comments_user_id", using: :btree

  create_table "django_content_type", force: true do |t|
    t.string "name",      limit: 100, null: false
    t.string "app_label", limit: 100, null: false
    t.string "model",     limit: 100, null: false
  end

  add_index "django_content_type", ["app_label", "model"], name: "django_content_type_app_label_model_key", unique: true, using: :btree

  create_table "django_facebook_facebook_invite", force: true do |t|
    t.datetime "updated_at",             null: false
    t.datetime "created_at",             null: false
    t.integer  "user_id",                null: false
    t.string   "user_invited",           null: false
    t.text     "message"
    t.string   "type"
    t.string   "wallpost_id"
    t.boolean  "error",                  null: false
    t.text     "error_message"
    t.datetime "last_attempt"
    t.string   "reminder_wallpost_id"
    t.boolean  "reminder_error",         null: false
    t.text     "reminder_error_message"
    t.datetime "reminder_last_attempt"
  end

  add_index "django_facebook_facebook_invite", ["user_id", "user_invited"], name: "django_facebook_facebook_invite_user_id_user_invited_key", unique: true, using: :btree
  add_index "django_facebook_facebook_invite", ["user_id"], name: "django_facebook_facebook_invite_user_id", using: :btree

  create_table "django_facebook_facebookcustomuser", force: true do |t|
    t.string   "password",             limit: 128, null: false
    t.datetime "last_login",                       null: false
    t.boolean  "is_superuser",                     null: false
    t.string   "username",             limit: 30,  null: false
    t.string   "first_name",           limit: 30,  null: false
    t.string   "last_name",            limit: 30,  null: false
    t.string   "email",                limit: 75,  null: false
    t.boolean  "is_staff",                         null: false
    t.boolean  "is_active",                        null: false
    t.datetime "date_joined",                      null: false
    t.text     "about_me"
    t.integer  "facebook_id",          limit: 8
    t.text     "access_token"
    t.string   "facebook_name"
    t.text     "facebook_profile_url"
    t.text     "website_url"
    t.text     "blog_url"
    t.date     "date_of_birth"
    t.string   "gender",               limit: 1
    t.text     "raw_data"
    t.boolean  "facebook_open_graph"
    t.boolean  "new_token_required",               null: false
    t.string   "image"
    t.string   "state"
  end

  add_index "django_facebook_facebookcustomuser", ["facebook_id"], name: "django_facebook_facebookcustomuser_facebook_id_key", unique: true, using: :btree
  add_index "django_facebook_facebookcustomuser", ["username"], name: "django_facebook_facebookcustomuser_username_key", unique: true, using: :btree
  add_index "django_facebook_facebookcustomuser", ["username"], name: "django_facebook_facebookcustomuser_username_like", using: :btree

  create_table "django_facebook_facebookcustomuser_groups", force: true do |t|
    t.integer "facebookcustomuser_id", null: false
    t.integer "group_id",              null: false
  end

  add_index "django_facebook_facebookcustomuser_groups", ["facebookcustomuser_id", "group_id"], name: "django_facebook_facebookcusto_facebookcustomuser_id_group_i_key", unique: true, using: :btree
  add_index "django_facebook_facebookcustomuser_groups", ["facebookcustomuser_id"], name: "django_facebook_facebookcustomuser_groups_facebookcustomuser_id", using: :btree
  add_index "django_facebook_facebookcustomuser_groups", ["group_id"], name: "django_facebook_facebookcustomuser_groups_group_id", using: :btree

  create_table "django_facebook_facebookcustomuser_user_permissions", force: true do |t|
    t.integer "facebookcustomuser_id", null: false
    t.integer "permission_id",         null: false
  end

  add_index "django_facebook_facebookcustomuser_user_permissions", ["facebookcustomuser_id", "permission_id"], name: "django_facebook_facebookcusto_facebookcustomuser_id_permiss_key", unique: true, using: :btree
  add_index "django_facebook_facebookcustomuser_user_permissions", ["facebookcustomuser_id"], name: "django_facebook_facebookcustomuser_user_permissions_faceboo7507", using: :btree
  add_index "django_facebook_facebookcustomuser_user_permissions", ["permission_id"], name: "django_facebook_facebookcustomuser_user_permissions_permiss4481", using: :btree

  create_table "django_facebook_facebooklike", force: true do |t|
    t.integer  "user_id",                null: false
    t.integer  "facebook_id",  limit: 8, null: false
    t.text     "name"
    t.text     "category"
    t.datetime "created_time"
  end

  add_index "django_facebook_facebooklike", ["user_id", "facebook_id"], name: "django_facebook_facebooklike_user_id_facebook_id_key", unique: true, using: :btree

  create_table "django_facebook_facebookprofile", force: true do |t|
    t.text    "about_me"
    t.integer "facebook_id",          limit: 8
    t.text    "access_token"
    t.string  "facebook_name"
    t.text    "facebook_profile_url"
    t.text    "website_url"
    t.text    "blog_url"
    t.date    "date_of_birth"
    t.string  "gender",               limit: 1
    t.text    "raw_data"
    t.boolean "facebook_open_graph"
    t.boolean "new_token_required",             null: false
    t.string  "image"
    t.integer "user_id",                        null: false
  end

  add_index "django_facebook_facebookprofile", ["facebook_id"], name: "django_facebook_facebookprofile_facebook_id_key", unique: true, using: :btree
  add_index "django_facebook_facebookprofile", ["user_id"], name: "django_facebook_facebookprofile_user_id_key", unique: true, using: :btree

  create_table "django_facebook_facebookuser", force: true do |t|
    t.integer "user_id",               null: false
    t.integer "facebook_id", limit: 8, null: false
    t.text    "name"
    t.string  "gender",      limit: 1
  end

  add_index "django_facebook_facebookuser", ["user_id", "facebook_id"], name: "django_facebook_facebookuser_user_id_facebook_id_key", unique: true, using: :btree

  create_table "django_messages_message", force: true do |t|
    t.string   "subject",              limit: 120, null: false
    t.text     "body",                             null: false
    t.integer  "sender_id",                        null: false
    t.integer  "recipient_id"
    t.integer  "parent_msg_id"
    t.datetime "sent_at"
    t.datetime "read_at"
    t.datetime "replied_at"
    t.datetime "sender_deleted_at"
    t.datetime "recipient_deleted_at"
  end

  add_index "django_messages_message", ["parent_msg_id"], name: "django_messages_message_parent_msg_id", using: :btree
  add_index "django_messages_message", ["recipient_id"], name: "django_messages_message_recipient_id", using: :btree
  add_index "django_messages_message", ["sender_id"], name: "django_messages_message_sender_id", using: :btree

  create_table "django_session", primary_key: "session_key", force: true do |t|
    t.text     "session_data", null: false
    t.datetime "expire_date",  null: false
  end

  add_index "django_session", ["expire_date"], name: "django_session_expire_date", using: :btree
  add_index "django_session", ["session_key"], name: "django_session_session_key_like", using: :btree

  create_table "django_site", force: true do |t|
    t.string "domain", limit: 100, null: false
    t.string "name",   limit: 50,  null: false
  end

  create_table "djcelery_crontabschedule", force: true do |t|
    t.string "minute",        limit: 64, null: false
    t.string "hour",          limit: 64, null: false
    t.string "day_of_week",   limit: 64, null: false
    t.string "day_of_month",  limit: 64, null: false
    t.string "month_of_year", limit: 64, null: false
  end

  create_table "djcelery_intervalschedule", force: true do |t|
    t.integer "every",             null: false
    t.string  "period", limit: 24, null: false
  end

  create_table "djcelery_periodictask", force: true do |t|
    t.string   "name",            limit: 200, null: false
    t.string   "task",            limit: 200, null: false
    t.integer  "interval_id"
    t.integer  "crontab_id"
    t.text     "args",                        null: false
    t.text     "kwargs",                      null: false
    t.string   "queue",           limit: 200
    t.string   "exchange",        limit: 200
    t.string   "routing_key",     limit: 200
    t.datetime "expires"
    t.boolean  "enabled",                     null: false
    t.datetime "last_run_at"
    t.integer  "total_run_count",             null: false
    t.datetime "date_changed",                null: false
    t.text     "description",                 null: false
  end

  add_index "djcelery_periodictask", ["crontab_id"], name: "djcelery_periodictask_crontab_id", using: :btree
  add_index "djcelery_periodictask", ["interval_id"], name: "djcelery_periodictask_interval_id", using: :btree
  add_index "djcelery_periodictask", ["name"], name: "djcelery_periodictask_name_key", unique: true, using: :btree
  add_index "djcelery_periodictask", ["name"], name: "djcelery_periodictask_name_like", using: :btree

  create_table "djcelery_periodictasks", primary_key: "ident", force: true do |t|
    t.datetime "last_update", null: false
  end

  create_table "djcelery_taskstate", force: true do |t|
    t.string   "state",     limit: 64,  null: false
    t.string   "task_id",   limit: 36,  null: false
    t.string   "name",      limit: 200
    t.datetime "tstamp",                null: false
    t.text     "args"
    t.text     "kwargs"
    t.datetime "eta"
    t.datetime "expires"
    t.text     "result"
    t.text     "traceback"
    t.float    "runtime"
    t.integer  "retries",               null: false
    t.integer  "worker_id"
    t.boolean  "hidden",                null: false
  end

  add_index "djcelery_taskstate", ["hidden"], name: "djcelery_taskstate_hidden", using: :btree
  add_index "djcelery_taskstate", ["name"], name: "djcelery_taskstate_name", using: :btree
  add_index "djcelery_taskstate", ["name"], name: "djcelery_taskstate_name_like", using: :btree
  add_index "djcelery_taskstate", ["state"], name: "djcelery_taskstate_state", using: :btree
  add_index "djcelery_taskstate", ["state"], name: "djcelery_taskstate_state_like", using: :btree
  add_index "djcelery_taskstate", ["task_id"], name: "djcelery_taskstate_task_id_key", unique: true, using: :btree
  add_index "djcelery_taskstate", ["task_id"], name: "djcelery_taskstate_task_id_like", using: :btree
  add_index "djcelery_taskstate", ["tstamp"], name: "djcelery_taskstate_tstamp", using: :btree
  add_index "djcelery_taskstate", ["worker_id"], name: "djcelery_taskstate_worker_id", using: :btree

  create_table "djcelery_workerstate", force: true do |t|
    t.string   "hostname",       null: false
    t.datetime "last_heartbeat"
  end

  add_index "djcelery_workerstate", ["hostname"], name: "djcelery_workerstate_hostname_key", unique: true, using: :btree
  add_index "djcelery_workerstate", ["hostname"], name: "djcelery_workerstate_hostname_like", using: :btree
  add_index "djcelery_workerstate", ["last_heartbeat"], name: "djcelery_workerstate_last_heartbeat", using: :btree

  create_table "entity_entity", force: true do |t|
    t.datetime "updated_at",                             null: false
    t.datetime "created_at",                             null: false
    t.integer  "site_id"
    t.integer  "category_id"
    t.string   "name",                                   null: false
    t.string   "slug",                                   null: false
    t.integer  "created_by_id",                          null: false
    t.inet     "created_by_ip",                          null: false
    t.boolean  "is_active",                              null: false
    t.boolean  "is_fashion",                             null: false
    t.boolean  "is_give_away",                           null: false
    t.boolean  "is_deal",                                null: false
    t.integer  "width"
    t.integer  "height"
    t.string   "image",                      limit: 100
    t.boolean  "image_on_cdn",                           null: false
    t.boolean  "love_changed",                           null: false
    t.boolean  "o_exchange",                             null: false
    t.text     "source_url",                             null: false
    t.text     "source_url_scraped"
    t.datetime "scraped_at"
    t.datetime "unavailable_since"
    t.boolean  "url_scraped"
    t.text     "source_url_converted"
    t.text     "image_url"
    t.text     "name_scraped"
    t.integer  "popularity",                             null: false
    t.integer  "views",                                  null: false
    t.integer  "loves",                                  null: false
    t.integer  "inappropriate_flags",                    null: false
    t.integer  "spam_flags",                             null: false
    t.integer  "recent_popularity",                      null: false
    t.integer  "recent_popularity_discount",             null: false
    t.integer  "recent_views",                           null: false
    t.integer  "recent_loves",                           null: false
    t.datetime "frontpage_reached_at"
    t.datetime "last_loved_at"
    t.datetime "last_foreign_loved_at"
    t.datetime "featured_at"
    t.boolean  "is_promoted",                            null: false
  end

  add_index "entity_entity", ["category_id"], name: "entity_entity_category_id", using: :btree
  add_index "entity_entity", ["created_by_id"], name: "entity_entity_created_by_id", using: :btree
  add_index "entity_entity", ["featured_at"], name: "entity_entity_featured_at", using: :btree
  add_index "entity_entity", ["popularity"], name: "entity_entity_popularity", using: :btree
  add_index "entity_entity", ["recent_popularity"], name: "entity_entity_recent_popularity", using: :btree
  add_index "entity_entity", ["site_id"], name: "entity_entity_site_id", using: :btree
  add_index "entity_entity", ["slug"], name: "entity_entity_slug", using: :btree
  add_index "entity_entity", ["slug"], name: "entity_entity_slug_like", using: :btree

  create_table "entity_entity_category", force: true do |t|
    t.datetime "updated_at",            null: false
    t.datetime "created_at",            null: false
    t.string   "name",       limit: 30, null: false
    t.string   "slug",       limit: 50, null: false
  end

  add_index "entity_entity_category", ["slug"], name: "entity_entity_category_slug", using: :btree
  add_index "entity_entity_category", ["slug"], name: "entity_entity_category_slug_like", using: :btree

  create_table "entity_entity_check_log", force: true do |t|
    t.datetime "updated_at",    null: false
    t.datetime "created_at",    null: false
    t.boolean  "checked",       null: false
    t.datetime "checked_at"
    t.integer  "checked_by_id"
    t.integer  "entity_id",     null: false
    t.boolean  "is_automated",  null: false
  end

  add_index "entity_entity_check_log", ["checked_by_id"], name: "entity_entity_check_log_checked_by_id", using: :btree
  add_index "entity_entity_check_log", ["entity_id"], name: "entity_entity_check_log_entity_id_key", unique: true, using: :btree

  create_table "entity_featured_fashiolista", force: true do |t|
    t.datetime "updated_at",                                 null: false
    t.datetime "created_at",                                 null: false
    t.integer  "user_id",                                    null: false
    t.text     "description",                                null: false
    t.string   "blog_deeplink",                  limit: 200, null: false
    t.boolean  "is_active",                                  null: false
    t.integer  "featured_by_id",                             null: false
    t.text     "description_template_overwrite"
  end

  add_index "entity_featured_fashiolista", ["featured_by_id"], name: "entity_featured_fashiolista_featured_by_id", using: :btree
  add_index "entity_featured_fashiolista", ["user_id"], name: "entity_featured_fashiolista_user_id_key", unique: true, using: :btree

  create_table "entity_give_away", primary_key: "entity_ptr_id", force: true do |t|
    t.text     "description"
    t.datetime "start_date",                          null: false
    t.datetime "end_date",                            null: false
    t.integer  "status",                              null: false
    t.integer  "action_type",                         null: false
    t.boolean  "hide_loves",                          null: false
    t.integer  "value"
    t.integer  "cost"
    t.boolean  "widget_placed",                       null: false
    t.string   "partner_site_link",       limit: 200
    t.integer  "partner_user_id"
    t.string   "intro_blog_post",         limit: 200
    t.string   "partner_intro_blog_post", limit: 200
    t.string   "end_blog_post",           limit: 200
    t.string   "partner_end_blog_post",   limit: 200
    t.string   "winner_end_blog_post",    limit: 200
    t.integer  "monthly_pageviews"
    t.integer  "monthly_unique_visitors"
    t.integer  "monthly_visits"
    t.integer  "facebook_followers"
    t.integer  "twitter_followers"
    t.integer  "blogloving_followers"
    t.integer  "comments_per_post"
  end

  add_index "entity_give_away", ["partner_user_id"], name: "entity_give_away_partner_user_id", using: :btree

  create_table "entity_love", force: true do |t|
    t.integer  "entity_id",     null: false
    t.integer  "user_id",       null: false
    t.integer  "influencer_id"
    t.integer  "location"
    t.datetime "created_at",    null: false
  end

  add_index "entity_love", ["entity_id", "user_id"], name: "entity_love_entity_id_user_id_key", unique: true, using: :btree
  add_index "entity_love", ["entity_id"], name: "entity_love_entity_id", using: :btree
  add_index "entity_love", ["influencer_id"], name: "entity_love_influencer_id", using: :btree
  add_index "entity_love", ["user_id"], name: "entity_love_user_id", using: :btree

  create_table "entity_love_history", primary_key: "entity_id", force: true do |t|
    t.date    "created_at", default: "now()", null: false
    t.integer "loves",      default: 0
  end

  create_table "entity_love_inactive", force: true do |t|
    t.integer  "entity_id",     null: false
    t.integer  "user_id",       null: false
    t.integer  "influencer_id"
    t.integer  "location"
    t.datetime "created_at",    null: false
  end

  add_index "entity_love_inactive", ["entity_id"], name: "entity_love_inactive_entity_id", using: :btree
  add_index "entity_love_inactive", ["influencer_id"], name: "entity_love_inactive_influencer_id", using: :btree
  add_index "entity_love_inactive", ["user_id"], name: "entity_love_inactive_user_id", using: :btree

  create_table "entity_love_location", force: true do |t|
    t.datetime "updated_at",            null: false
    t.datetime "created_at",            null: false
    t.string   "name",       limit: 50, null: false
  end

  add_index "entity_love_location", ["name"], name: "entity_love_location_name_key", unique: true, using: :btree
  add_index "entity_love_location", ["name"], name: "entity_love_location_name_like", using: :btree

  create_table "entity_related_entity", force: true do |t|
    t.datetime "updated_at",    null: false
    t.datetime "created_at",    null: false
    t.integer  "source_id",     null: false
    t.integer  "target_id",     null: false
    t.integer  "created_by_id", null: false
  end

  add_index "entity_related_entity", ["created_by_id"], name: "entity_related_entity_created_by_id", using: :btree
  add_index "entity_related_entity", ["source_id"], name: "entity_related_entity_source_id", using: :btree
  add_index "entity_related_entity", ["target_id"], name: "entity_related_entity_target_id", using: :btree

  create_table "entity_scraping_log", force: true do |t|
    t.datetime "updated_at",               null: false
    t.datetime "created_at",               null: false
    t.integer  "site_id"
    t.integer  "user_id",                  null: false
    t.text     "url"
    t.date     "date"
    t.boolean  "server_side",              null: false
    t.integer  "selected_image_position"
    t.text     "js_exception"
    t.text     "scraping_exception"
    t.integer  "images_count",             null: false
    t.integer  "client_side_images_count", null: false
    t.integer  "item_id"
  end

  add_index "entity_scraping_log", ["item_id"], name: "entity_scraping_log_item_id", using: :btree
  add_index "entity_scraping_log", ["site_id", "user_id", "url", "date"], name: "entity_scraping_log_site_id_user_id_url_date_key", unique: true, using: :btree
  add_index "entity_scraping_log", ["site_id"], name: "entity_scraping_log_site_id", using: :btree
  add_index "entity_scraping_log", ["user_id"], name: "entity_scraping_log_user_id", using: :btree

  create_table "entity_site", force: true do |t|
    t.datetime "updated_at",                                     null: false
    t.datetime "created_at",                                     null: false
    t.string   "domain",                                         null: false
    t.float    "popularity_multiplier"
    t.integer  "clicks",                                         null: false
    t.integer  "monetized_clicks",                               null: false
    t.decimal  "epc",                   precision: 5,  scale: 2, null: false
    t.decimal  "commission",            precision: 10, scale: 2, null: false
    t.integer  "category_id",                                    null: false
    t.boolean  "subdomain",                                      null: false
    t.boolean  "blocked",                                        null: false
    t.boolean  "in_shop_list",                                   null: false
    t.integer  "related_user_id"
    t.text     "description"
    t.string   "shop_name"
    t.integer  "order",                                          null: false
    t.boolean  "featured",                                       null: false
    t.boolean  "shop_data_complete",                             null: false
    t.text     "shop_url"
  end

  add_index "entity_site", ["category_id"], name: "entity_site_category_id", using: :btree
  add_index "entity_site", ["domain"], name: "entity_site_domain_key", unique: true, using: :btree
  add_index "entity_site", ["domain"], name: "entity_site_domain_like", using: :btree
  add_index "entity_site", ["related_user_id"], name: "entity_site_related_user_id", using: :btree

  create_table "entity_site_category", force: true do |t|
    t.datetime "updated_at",                 null: false
    t.datetime "created_at",                 null: false
    t.string   "name",                       null: false
    t.float    "popularity_multiplier",      null: false
    t.boolean  "is_fashion",                 null: false
    t.integer  "default_entity_category_id"
  end

  add_index "entity_site_category", ["default_entity_category_id"], name: "entity_site_category_default_entity_category_id", using: :btree

  create_table "entity_site_image", force: true do |t|
    t.datetime "updated_at",               null: false
    t.datetime "created_at",               null: false
    t.integer  "site_id"
    t.boolean  "featured",                 null: false
    t.integer  "width"
    t.integer  "height"
    t.string   "image",        limit: 100
    t.boolean  "image_on_cdn",             null: false
  end

  add_index "entity_site_image", ["site_id"], name: "entity_site_image_site_id", using: :btree

  create_table "entity_style", force: true do |t|
    t.string   "name",                     null: false
    t.string   "slug",         limit: 50,  null: false
    t.integer  "order",                    null: false
    t.boolean  "is_active",                null: false
    t.datetime "updated_at",               null: false
    t.datetime "created_at",               null: false
    t.integer  "width"
    t.integer  "height"
    t.boolean  "image_on_cdn",             null: false
    t.string   "image",        limit: 100
  end

  add_index "entity_style", ["slug"], name: "entity_style_slug", using: :btree
  add_index "entity_style", ["slug"], name: "entity_style_slug_like", using: :btree

  create_table "entity_style_group", force: true do |t|
    t.string   "name",                     null: false
    t.string   "slug",         limit: 50,  null: false
    t.integer  "order",                    null: false
    t.boolean  "is_active",                null: false
    t.datetime "updated_at",               null: false
    t.datetime "created_at",               null: false
    t.integer  "width"
    t.integer  "height"
    t.boolean  "image_on_cdn",             null: false
    t.string   "image",        limit: 100
  end

  add_index "entity_style_group", ["slug"], name: "entity_style_group_slug", using: :btree
  add_index "entity_style_group", ["slug"], name: "entity_style_group_slug_like", using: :btree

  create_table "entity_stylegroup_style", force: true do |t|
    t.integer "stylegroup_id", null: false
    t.integer "style_id",      null: false
  end

  add_index "entity_stylegroup_style", ["style_id"], name: "entity_stylegroup_style_style_id", using: :btree
  add_index "entity_stylegroup_style", ["stylegroup_id", "style_id"], name: "entity_stylegroup_style_stylegroup_id_style_id_key", unique: true, using: :btree
  add_index "entity_stylegroup_style", ["stylegroup_id"], name: "entity_stylegroup_style_stylegroup_id", using: :btree

  create_table "entity_test_love", force: true do |t|
    t.datetime "updated_at",           null: false
    t.datetime "created_at",           null: false
    t.integer  "entity_id",            null: false
    t.integer  "user_id",              null: false
    t.datetime "love_checked_at"
    t.datetime "love_removed_at"
    t.string   "version_task_started"
    t.string   "instance_id"
  end

  add_index "entity_test_love", ["entity_id", "user_id"], name: "entity_test_love_entity_id_user_id_key", unique: true, using: :btree
  add_index "entity_test_love", ["entity_id"], name: "entity_test_love_entity_id", using: :btree
  add_index "entity_test_love", ["user_id"], name: "entity_test_love_user_id", using: :btree

  create_table "entity_trend_highlight", force: true do |t|
    t.boolean  "is_active",         null: false
    t.datetime "updated_at",        null: false
    t.datetime "created_at",        null: false
    t.string   "title",             null: false
    t.text     "short_description", null: false
    t.string   "search_query",      null: false
    t.integer  "item_id",           null: false
    t.datetime "publish_at",        null: false
  end

  add_index "entity_trend_highlight", ["item_id"], name: "entity_trend_highlight_item_id", using: :btree

  create_table "event_event", force: true do |t|
    t.datetime "updated_at",                    null: false
    t.datetime "created_at",                    null: false
    t.string   "name",                          null: false
    t.string   "slug",              limit: 50,  null: false
    t.text     "description"
    t.text     "short_description"
    t.string   "list_search"
    t.text     "sidebar"
    t.datetime "start",                         null: false
    t.datetime "end",                           null: false
    t.boolean  "is_active",                     null: false
    t.string   "header_image",      limit: 100
  end

  add_index "event_event", ["slug"], name: "event_event_slug", using: :btree
  add_index "event_event", ["slug"], name: "event_event_slug_like", using: :btree

  create_table "event_framework_communication_event_handler", force: true do |t|
    t.datetime "updated_at",             null: false
    t.datetime "created_at",             null: false
    t.integer  "communication_id"
    t.integer  "admin_communication_id"
    t.boolean  "foreign_user",           null: false
  end

  add_index "event_framework_communication_event_handler", ["admin_communication_id"], name: "event_framework_communication_event_handler_admin_communicaafb5", using: :btree
  add_index "event_framework_communication_event_handler", ["communication_id"], name: "event_framework_communication_event_handler_communication_id", using: :btree

  create_table "event_framework_event", force: true do |t|
    t.datetime "updated_at",                null: false
    t.datetime "created_at",                null: false
    t.string   "name",                      null: false
    t.string   "slug",           limit: 50, null: false
    t.boolean  "user_triggered",            null: false
  end

  add_index "event_framework_event", ["slug"], name: "event_framework_event_slug_key", unique: true, using: :btree
  add_index "event_framework_event", ["slug"], name: "event_framework_event_slug_like", using: :btree

  create_table "event_framework_event_binding", force: true do |t|
    t.datetime "updated_at",      null: false
    t.datetime "created_at",      null: false
    t.integer  "event_id",        null: false
    t.boolean  "deferred",        null: false
    t.integer  "content_type_id", null: false
    t.integer  "object_id",       null: false
    t.integer  "order",           null: false
  end

  add_index "event_framework_event_binding", ["content_type_id"], name: "event_framework_event_binding_content_type_id", using: :btree
  add_index "event_framework_event_binding", ["event_id"], name: "event_framework_event_binding_event_id", using: :btree

  create_table "event_framework_event_handler_queue", force: true do |t|
    t.datetime "updated_at",       null: false
    t.datetime "created_at",       null: false
    t.integer  "event_history_id", null: false
    t.integer  "binding_id",       null: false
    t.integer  "status",           null: false
    t.datetime "completed_at"
  end

  add_index "event_framework_event_handler_queue", ["binding_id"], name: "event_framework_event_handler_queue_binding_id", using: :btree
  add_index "event_framework_event_handler_queue", ["event_history_id"], name: "event_framework_event_handler_queue_event_history_id", using: :btree

  create_table "event_framework_event_history", force: true do |t|
    t.datetime "updated_at",        null: false
    t.datetime "created_at",        null: false
    t.integer  "user_id",           null: false
    t.integer  "event_id",          null: false
    t.integer  "content_type_id"
    t.integer  "object_id"
    t.integer  "related_entity_id"
    t.text     "event_data"
    t.boolean  "completed",         null: false
  end

  add_index "event_framework_event_history", ["content_type_id"], name: "event_framework_event_history_content_type_id", using: :btree
  add_index "event_framework_event_history", ["event_id"], name: "event_framework_event_history_event_id", using: :btree
  add_index "event_framework_event_history", ["user_id"], name: "event_framework_event_history_user_id", using: :btree

  create_table "event_framework_event_requirement_field", force: true do |t|
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.integer  "event_id",   null: false
    t.string   "field",      null: false
  end

  add_index "event_framework_event_requirement_field", ["event_id"], name: "event_framework_event_requirement_field_event_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["target_id"], name: "index_follows_on_target_id", using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "gargoyle_switch", primary_key: "key", force: true do |t|
    t.text     "value",                    null: false
    t.string   "label",        limit: 150
    t.datetime "date_created",             null: false
    t.text     "description"
    t.integer  "status",       limit: 2,   null: false
  end

  add_index "gargoyle_switch", ["key"], name: "gargoyle_switch_key_like", using: :btree

  create_table "items", force: true do |t|
    t.string   "image"
    t.text     "message"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "lists_base_list", force: true do |t|
    t.datetime "updated_at",    null: false
    t.datetime "created_at",    null: false
    t.string   "name",          null: false
    t.string   "slug",          null: false
    t.boolean  "default",       null: false
    t.integer  "created_by_id", null: false
  end

  add_index "lists_base_list", ["created_by_id"], name: "lists_base_list_created_by_id", using: :btree
  add_index "lists_base_list", ["name"], name: "lists_base_list_name_key", unique: true, using: :btree
  add_index "lists_base_list", ["name"], name: "lists_base_list_name_like", using: :btree
  add_index "lists_base_list", ["slug"], name: "lists_base_list_slug", using: :btree
  add_index "lists_base_list", ["slug"], name: "lists_base_list_slug_like", using: :btree

  create_table "lists_featured_look", force: true do |t|
    t.boolean  "is_active",   null: false
    t.datetime "updated_at",  null: false
    t.datetime "created_at",  null: false
    t.integer  "userlist_id", null: false
    t.datetime "publish_at",  null: false
  end

  add_index "lists_featured_look", ["userlist_id"], name: "lists_featured_look_userlist_id", using: :btree

  create_table "lists_list_item", force: true do |t|
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.integer  "list_id",    null: false
    t.integer  "entity_id",  null: false
    t.integer  "order",      null: false
  end

  add_index "lists_list_item", ["entity_id"], name: "lists_list_item_entity_id", using: :btree
  add_index "lists_list_item", ["list_id", "entity_id"], name: "lists_list_item_list_id_entity_id_key", unique: true, using: :btree
  add_index "lists_list_item", ["list_id"], name: "lists_list_item_list_id", using: :btree

  create_table "lists_user_list", force: true do |t|
    t.datetime "updated_at",                     null: false
    t.datetime "created_at",                     null: false
    t.boolean  "is_active",                      null: false
    t.integer  "base_id",                        null: false
    t.integer  "user_id",                        null: false
    t.text     "description"
    t.integer  "width"
    t.integer  "height"
    t.string   "image",              limit: 100
    t.boolean  "image_on_cdn",                   null: false
    t.datetime "last_updated_at",                null: false
    t.integer  "item_count",                     null: false
    t.boolean  "stick_to_frontpage",             null: false
    t.text     "related_url"
    t.datetime "image_updated_at"
    t.integer  "contest_id"
    t.integer  "dynamic_contest_id"
    t.integer  "iframe_contest_id"
    t.integer  "cover_entity_id"
  end

  add_index "lists_user_list", ["base_id", "user_id"], name: "lists_user_list_base_id_user_id_key", unique: true, using: :btree
  add_index "lists_user_list", ["base_id"], name: "lists_user_list_base_id", using: :btree
  add_index "lists_user_list", ["contest_id"], name: "lists_user_list_contest_id", using: :btree
  add_index "lists_user_list", ["cover_entity_id"], name: "lists_user_list_cover_entity_id", using: :btree
  add_index "lists_user_list", ["dynamic_contest_id"], name: "lists_user_list_dynamic_contest_id", using: :btree
  add_index "lists_user_list", ["iframe_contest_id"], name: "lists_user_list_iframe_contest_id", using: :btree
  add_index "lists_user_list", ["user_id"], name: "lists_user_list_user_id", using: :btree

  create_table "pins", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "influencer_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pins", ["influencer_id"], name: "index_pins_on_influencer_id", using: :btree
  add_index "pins", ["item_id"], name: "index_pins_on_item_id", using: :btree
  add_index "pins", ["user_id"], name: "index_pins_on_user_id", using: :btree

  create_table "qandstats_default", force: true do |t|
    t.datetime "updated_at",             null: false
    t.datetime "created_at",             null: false
    t.integer  "query_id",               null: false
    t.string   "name",       limit: 100, null: false
    t.text     "value",                  null: false
  end

  add_index "qandstats_default", ["query_id", "name"], name: "qandstats_default_query_id_name_key", unique: true, using: :btree
  add_index "qandstats_default", ["query_id"], name: "qandstats_default_query_id", using: :btree

  create_table "qandstats_group", force: true do |t|
    t.datetime "updated_at",            null: false
    t.datetime "created_at",            null: false
    t.string   "title",                 null: false
    t.string   "slug",       limit: 50, null: false
  end

  add_index "qandstats_group", ["slug"], name: "qandstats_group_slug", using: :btree
  add_index "qandstats_group", ["slug"], name: "qandstats_group_slug_like", using: :btree
  add_index "qandstats_group", ["title"], name: "qandstats_group_title_key", unique: true, using: :btree
  add_index "qandstats_group", ["title"], name: "qandstats_group_title_like", using: :btree

  create_table "qandstats_page", force: true do |t|
    t.datetime "updated_at",            null: false
    t.datetime "created_at",            null: false
    t.integer  "group_id"
    t.string   "title",                 null: false
    t.string   "slug",       limit: 50, null: false
  end

  add_index "qandstats_page", ["group_id"], name: "qandstats_page_group_id", using: :btree
  add_index "qandstats_page", ["slug"], name: "qandstats_page_slug", using: :btree
  add_index "qandstats_page", ["slug"], name: "qandstats_page_slug_like", using: :btree

  create_table "qandstats_page_queries", force: true do |t|
    t.integer "page_id",  null: false
    t.integer "query_id", null: false
    t.integer "position", null: false
  end

  add_index "qandstats_page_queries", ["page_id", "position"], name: "qandstats_page_queries_page_id_position_key", unique: true, using: :btree
  add_index "qandstats_page_queries", ["page_id"], name: "qandstats_page_queries_page_id", using: :btree
  add_index "qandstats_page_queries", ["query_id"], name: "qandstats_page_queries_query_id", using: :btree

  create_table "qandstats_query", force: true do |t|
    t.datetime "updated_at",             null: false
    t.datetime "created_at",             null: false
    t.string   "using",       limit: 50, null: false
    t.string   "title",                  null: false
    t.text     "description",            null: false
    t.text     "sql",                    null: false
    t.text     "js",                     null: false
    t.integer  "group_id"
  end

  add_index "qandstats_query", ["group_id"], name: "qandstats_query_group_id", using: :btree

  create_table "reversion_revision", force: true do |t|
    t.string   "manager_slug", limit: 200, null: false
    t.datetime "date_created",             null: false
    t.integer  "user_id"
    t.text     "comment",                  null: false
  end

  add_index "reversion_revision", ["manager_slug"], name: "reversion_revision_manager_slug", using: :btree
  add_index "reversion_revision", ["manager_slug"], name: "reversion_revision_manager_slug_like", using: :btree
  add_index "reversion_revision", ["user_id"], name: "reversion_revision_user_id", using: :btree

  create_table "reversion_version", force: true do |t|
    t.integer "revision_id",               null: false
    t.text    "object_id",                 null: false
    t.integer "object_id_int"
    t.integer "content_type_id",           null: false
    t.string  "format",                    null: false
    t.text    "serialized_data",           null: false
    t.text    "object_repr",               null: false
    t.integer "type",            limit: 2, null: false
  end

  add_index "reversion_version", ["content_type_id"], name: "reversion_version_content_type_id", using: :btree
  add_index "reversion_version", ["object_id_int"], name: "reversion_version_object_id_int", using: :btree
  add_index "reversion_version", ["revision_id"], name: "reversion_version_revision_id", using: :btree
  add_index "reversion_version", ["type"], name: "reversion_version_type", using: :btree

  create_table "robots_rule", force: true do |t|
    t.string  "robot",                               null: false
    t.decimal "crawl_delay", precision: 3, scale: 1
  end

  create_table "robots_rule_allowed", force: true do |t|
    t.integer "rule_id", null: false
    t.integer "url_id",  null: false
  end

  add_index "robots_rule_allowed", ["rule_id", "url_id"], name: "robots_rule_allowed_rule_id_url_id_key", unique: true, using: :btree
  add_index "robots_rule_allowed", ["rule_id"], name: "robots_rule_allowed_rule_id", using: :btree
  add_index "robots_rule_allowed", ["url_id"], name: "robots_rule_allowed_url_id", using: :btree

  create_table "robots_rule_disallowed", force: true do |t|
    t.integer "rule_id", null: false
    t.integer "url_id",  null: false
  end

  add_index "robots_rule_disallowed", ["rule_id", "url_id"], name: "robots_rule_disallowed_rule_id_url_id_key", unique: true, using: :btree
  add_index "robots_rule_disallowed", ["rule_id"], name: "robots_rule_disallowed_rule_id", using: :btree
  add_index "robots_rule_disallowed", ["url_id"], name: "robots_rule_disallowed_url_id", using: :btree

  create_table "robots_rule_sites", force: true do |t|
    t.integer "rule_id", null: false
    t.integer "site_id", null: false
  end

  add_index "robots_rule_sites", ["rule_id", "site_id"], name: "robots_rule_sites_rule_id_site_id_key", unique: true, using: :btree
  add_index "robots_rule_sites", ["rule_id"], name: "robots_rule_sites_rule_id", using: :btree
  add_index "robots_rule_sites", ["site_id"], name: "robots_rule_sites_site_id", using: :btree

  create_table "robots_url", force: true do |t|
    t.string "pattern", null: false
  end

  create_table "simple_mail_email_click_track", primary_key: "user_id", force: true do |t|
    t.datetime "received_at"
    t.string   "campaign"
    t.string   "url"
  end

  create_table "simple_mail_email_open_track", primary_key: "user_id", force: true do |t|
    t.datetime "received_at"
    t.string   "campaign"
  end

  create_table "simple_mail_sent_mail", force: true do |t|
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "sent_at"
    t.string   "subject"
  end

  add_index "simple_mail_sent_mail", ["user_id", "subject"], name: "simple_mail_sent_mail_user_id_subject_key", unique: true, using: :btree

  create_table "simple_notification_dismissed_notification", force: true do |t|
    t.datetime "updated_at",      null: false
    t.datetime "created_at",      null: false
    t.integer  "user_id",         null: false
    t.integer  "notification_id", null: false
  end

  add_index "simple_notification_dismissed_notification", ["notification_id"], name: "simple_notification_dismissed_notification_notification_id", using: :btree
  add_index "simple_notification_dismissed_notification", ["user_id"], name: "simple_notification_dismissed_notification_user_id", using: :btree

  create_table "simple_notification_notification", force: true do |t|
    t.datetime "updated_at",            null: false
    t.datetime "created_at",            null: false
    t.string   "category",   limit: 50
    t.string   "slug",       limit: 50
    t.text     "message"
    t.boolean  "is_active",             null: false
  end

  add_index "simple_notification_notification", ["category"], name: "simple_notification_notification_category", using: :btree
  add_index "simple_notification_notification", ["category"], name: "simple_notification_notification_category_like", using: :btree
  add_index "simple_notification_notification", ["slug"], name: "simple_notification_notification_slug", using: :btree
  add_index "simple_notification_notification", ["slug"], name: "simple_notification_notification_slug_like", using: :btree

  create_table "south_migrationhistory", force: true do |t|
    t.string   "app_name",  null: false
    t.string   "migration", null: false
    t.datetime "applied",   null: false
  end

  create_table "tagging_tag", force: true do |t|
    t.string  "name",        limit: 50, null: false
    t.string  "slug",        limit: 50, null: false
    t.integer "type_id"
    t.integer "usage_count",            null: false
  end

  add_index "tagging_tag", ["name"], name: "tagging_tag_name_key", unique: true, using: :btree
  add_index "tagging_tag", ["name"], name: "tagging_tag_name_like", using: :btree
  add_index "tagging_tag", ["slug"], name: "tagging_tag_slug_key", unique: true, using: :btree
  add_index "tagging_tag", ["slug"], name: "tagging_tag_slug_like", using: :btree
  add_index "tagging_tag", ["type_id"], name: "tagging_tag_type_id", using: :btree

  create_table "tagging_tag_type", force: true do |t|
    t.datetime "updated_at",            null: false
    t.datetime "created_at",            null: false
    t.string   "name",       limit: 50, null: false
    t.string   "slug",       limit: 50, null: false
    t.boolean  "no_index",              null: false
  end

  add_index "tagging_tag_type", ["name"], name: "tagging_tag_type_name_key", unique: true, using: :btree
  add_index "tagging_tag_type", ["name"], name: "tagging_tag_type_name_like", using: :btree
  add_index "tagging_tag_type", ["slug"], name: "tagging_tag_type_slug_key", unique: true, using: :btree
  add_index "tagging_tag_type", ["slug"], name: "tagging_tag_type_slug_like", using: :btree

  create_table "tagging_taggeditem", force: true do |t|
    t.integer  "tag_id",          null: false
    t.integer  "content_type_id", null: false
    t.integer  "object_id",       null: false
    t.integer  "user_id"
    t.datetime "created_at"
  end

  add_index "tagging_taggeditem", ["content_type_id"], name: "tagging_taggeditem_content_type_id", using: :btree
  add_index "tagging_taggeditem", ["object_id"], name: "tagging_taggeditem_object_id", using: :btree
  add_index "tagging_taggeditem", ["tag_id", "content_type_id", "object_id"], name: "tagging_taggeditem_tag_id_content_type_id_object_id_key", unique: true, using: :btree
  add_index "tagging_taggeditem", ["tag_id"], name: "tagging_taggeditem_tag_id", using: :btree
  add_index "tagging_taggeditem", ["user_id"], name: "tagging_taggeditem_user_id", using: :btree

  create_table "tcc_comment", force: true do |t|
    t.integer  "content_type_id",               null: false
    t.integer  "object_pk",                     null: false
    t.integer  "parent_id"
    t.integer  "user_id",                       null: false
    t.inet     "ip_address",                    null: false
    t.string   "user_name",         limit: 50,  null: false
    t.string   "user_email",        limit: 75,  null: false
    t.string   "user_url",          limit: 200, null: false
    t.datetime "submit_date",                   null: false
    t.text     "comment",                       null: false
    t.text     "comment_raw",                   null: false
    t.boolean  "is_open",                       null: false
    t.boolean  "is_removed",                    null: false
    t.boolean  "is_approved",                   null: false
    t.boolean  "is_public",                     null: false
    t.boolean  "is_spam",                       null: false
    t.integer  "spam_report_count",             null: false
    t.integer  "spam_status"
    t.boolean  "is_checked",                    null: false
    t.datetime "email_sent_at"
    t.integer  "child_count",                   null: false
    t.datetime "sort_date",                     null: false
    t.integer  "index",                         null: false
  end

  add_index "tcc_comment", ["content_type_id", "object_pk", "parent_id", "index"], name: "tcc_comment_content_type_id_object_pk_parent_id_index_key", unique: true, using: :btree
  add_index "tcc_comment", ["content_type_id"], name: "tcc_comment_content_type_id", using: :btree
  add_index "tcc_comment", ["is_checked"], name: "tcc_comment_is_checked", using: :btree
  add_index "tcc_comment", ["parent_id"], name: "tcc_comment_parent_id", using: :btree
  add_index "tcc_comment", ["sort_date"], name: "tcc_comment_sort_date", using: :btree
  add_index "tcc_comment", ["spam_report_count"], name: "tcc_comment_spam_report_count", using: :btree
  add_index "tcc_comment", ["submit_date"], name: "tcc_comment_submit_date", using: :btree
  add_index "tcc_comment", ["user_id"], name: "tcc_comment_user_id", using: :btree

  create_table "tcc_comment_unsubscribers", force: true do |t|
    t.integer "comment_id", null: false
    t.integer "user_id",    null: false
  end

  add_index "tcc_comment_unsubscribers", ["comment_id", "user_id"], name: "tcc_comment_unsubscribers_comment_id_user_id_key", unique: true, using: :btree
  add_index "tcc_comment_unsubscribers", ["comment_id"], name: "tcc_comment_unsubscribers_comment_id", using: :btree
  add_index "tcc_comment_unsubscribers", ["user_id"], name: "tcc_comment_unsubscribers_user_id", using: :btree

  create_table "tcc_spamreport", force: true do |t|
    t.integer "comment_id", null: false
    t.integer "user_id",    null: false
  end

  add_index "tcc_spamreport", ["comment_id"], name: "tcc_spamreport_comment_id", using: :btree
  add_index "tcc_spamreport", ["user_id", "comment_id"], name: "tcc_spamreport_user_id_comment_id_key", unique: true, using: :btree
  add_index "tcc_spamreport", ["user_id"], name: "tcc_spamreport_user_id", using: :btree

  create_table "tcc_subscription", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "comment_id", null: false
    t.datetime "read_at"
  end

  add_index "tcc_subscription", ["comment_id"], name: "tcc_subscription_comment_id", using: :btree
  add_index "tcc_subscription", ["read_at"], name: "tcc_subscription_read_at", using: :btree
  add_index "tcc_subscription", ["user_id", "comment_id"], name: "tcc_subscription_user_id_comment_id_key", unique: true, using: :btree
  add_index "tcc_subscription", ["user_id"], name: "tcc_subscription_user_id", using: :btree

  create_table "upload_file", force: true do |t|
    t.datetime "updated_at",               null: false
    t.datetime "created_at",               null: false
    t.string   "name",                     null: false
    t.integer  "width"
    t.integer  "height"
    t.boolean  "image_on_cdn",             null: false
    t.string   "image",        limit: 100
  end

  create_table "user_address", force: true do |t|
    t.datetime "updated_at",                   null: false
    t.datetime "created_at",                   null: false
    t.integer  "user_id",                      null: false
    t.string   "first_name",                   null: false
    t.string   "last_name",                    null: false
    t.string   "email",            limit: 75,  null: false
    t.string   "street",                       null: false
    t.string   "house_number",     limit: 100, null: false
    t.string   "zip_code",         limit: 100, null: false
    t.string   "state",                        null: false
    t.string   "city",             limit: 100, null: false
    t.string   "country_id",       limit: 2,   null: false
    t.string   "telephone_number", limit: 100
  end

  add_index "user_address", ["country_id"], name: "user_address_country_id", using: :btree
  add_index "user_address", ["country_id"], name: "user_address_country_id_like", using: :btree
  add_index "user_address", ["user_id"], name: "user_address_user_id", using: :btree

  create_table "user_alpha_invite", force: true do |t|
    t.datetime "updated_at",            null: false
    t.datetime "created_at",            null: false
    t.string   "email",      limit: 75, null: false
  end

  create_table "user_authentication_token", force: true do |t|
    t.datetime "updated_at",            null: false
    t.datetime "created_at",            null: false
    t.integer  "user_id",               null: false
    t.string   "token",      limit: 64, null: false
    t.boolean  "is_active",             null: false
  end

  add_index "user_authentication_token", ["token"], name: "user_authentication_token_token_key", unique: true, using: :btree
  add_index "user_authentication_token", ["token"], name: "user_authentication_token_token_like", using: :btree
  add_index "user_authentication_token", ["user_id"], name: "user_authentication_token_user_id_key", unique: true, using: :btree

  create_table "user_blocked_ip", force: true do |t|
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.inet     "ip",         null: false
    t.integer  "user_id"
  end

  add_index "user_blocked_ip", ["ip", "user_id"], name: "user_blocked_ip_ip_user_id_key", unique: true, using: :btree
  add_index "user_blocked_ip", ["user_id"], name: "user_blocked_ip_user_id", using: :btree

  create_table "user_communication", force: true do |t|
    t.datetime "updated_at",                      null: false
    t.datetime "created_at",                      null: false
    t.string   "name",                            null: false
    t.string   "slug",                 limit: 50, null: false
    t.integer  "category_id",                     null: false
    t.boolean  "translate",                       null: false
    t.text     "html_email"
    t.text     "text_email"
    t.string   "from_email_overwrite"
    t.text     "subject"
    t.integer  "email_status",                    null: false
    t.integer  "importance",                      null: false
    t.boolean  "batch_email",                     null: false
  end

  add_index "user_communication", ["category_id"], name: "user_communication_category_id", using: :btree
  add_index "user_communication", ["slug"], name: "user_communication_slug_key", unique: true, using: :btree
  add_index "user_communication", ["slug"], name: "user_communication_slug_like", using: :btree

  create_table "user_communication_category", force: true do |t|
    t.datetime "updated_at",                 null: false
    t.datetime "created_at",                 null: false
    t.string   "name",                       null: false
    t.string   "slug",            limit: 50, null: false
    t.text     "help"
    t.boolean  "default_enabled",            null: false
    t.boolean  "mutable",                    null: false
  end

  add_index "user_communication_category", ["slug"], name: "user_communication_category_slug_key", unique: true, using: :btree
  add_index "user_communication_category", ["slug"], name: "user_communication_category_slug_like", using: :btree

  create_table "user_communication_queue", force: true do |t|
    t.datetime "updated_at",                  null: false
    t.datetime "created_at",                  null: false
    t.string   "email",            limit: 75
    t.integer  "user_id"
    t.integer  "event_history_id"
    t.text     "extra_context"
    t.integer  "communication_id",            null: false
    t.integer  "priority",                    null: false
    t.integer  "status",                      null: false
    t.datetime "message_read_at"
  end

  add_index "user_communication_queue", ["communication_id"], name: "user_communication_queue_communication_id", using: :btree
  add_index "user_communication_queue", ["event_history_id"], name: "user_communication_queue_event_history_id", using: :btree
  add_index "user_communication_queue", ["user_id"], name: "user_communication_queue_user_id", using: :btree

  create_table "user_content_flag", force: true do |t|
    t.integer  "user_id",         null: false
    t.inet     "user_ip",         null: false
    t.text     "comment"
    t.integer  "flag_type",       null: false
    t.integer  "checked_by_id"
    t.integer  "content_type_id", null: false
    t.integer  "object_id",       null: false
    t.datetime "created_at",      null: false
  end

  add_index "user_content_flag", ["checked_by_id"], name: "user_content_flag_checked_by_id", using: :btree
  add_index "user_content_flag", ["content_type_id"], name: "user_content_flag_content_type_id", using: :btree
  add_index "user_content_flag", ["user_id", "flag_type", "content_type_id", "object_id"], name: "user_content_flag_user_id_flag_type_content_type_id_object__key", unique: true, using: :btree
  add_index "user_content_flag", ["user_id"], name: "user_content_flag_user_id", using: :btree

  create_table "user_facebook_invite", force: true do |t|
    t.datetime "updated_at",             null: false
    t.datetime "created_at",             null: false
    t.integer  "user_id",                null: false
    t.string   "user_invited",           null: false
    t.text     "message"
    t.string   "type"
    t.string   "wallpost_id"
    t.boolean  "error",                  null: false
    t.text     "error_message"
    t.datetime "last_attempt"
    t.string   "reminder_wallpost_id"
    t.boolean  "reminder_error",         null: false
    t.text     "reminder_error_message"
    t.datetime "reminder_last_attempt"
  end

  add_index "user_facebook_invite", ["user_id", "user_invited"], name: "user_facebook_invite_user_id_user_invited_key", unique: true, using: :btree
  add_index "user_facebook_invite", ["user_id"], name: "user_facebook_invite_user_id", using: :btree

  create_table "user_facebook_page_tab", force: true do |t|
    t.datetime "updated_at",                null: false
    t.datetime "created_at",                null: false
    t.integer  "user_id"
    t.integer  "page_id",         limit: 8, null: false
    t.integer  "created_by_user", limit: 8
  end

  add_index "user_facebook_page_tab", ["page_id"], name: "user_facebook_page_tab_page_id_key", unique: true, using: :btree
  add_index "user_facebook_page_tab", ["user_id"], name: "user_facebook_page_tab_user_id", using: :btree

  create_table "user_facebook_wallpost", force: true do |t|
    t.datetime "updated_at",   null: false
    t.datetime "created_at",   null: false
    t.integer  "user_id",      null: false
    t.integer  "entity_id",    null: false
    t.text     "wallpost_id"
    t.string   "type"
    t.boolean  "error",        null: false
    t.datetime "last_attempt"
  end

  add_index "user_facebook_wallpost", ["entity_id"], name: "user_facebook_wallpost_entity_id", using: :btree
  add_index "user_facebook_wallpost", ["user_id", "entity_id"], name: "user_facebook_wallpost_user_id_entity_id_key", unique: true, using: :btree
  add_index "user_facebook_wallpost", ["user_id"], name: "user_facebook_wallpost_user_id", using: :btree

  create_table "user_feature_location", force: true do |t|
    t.datetime "updated_at",            null: false
    t.datetime "created_at",            null: false
    t.string   "slug",       limit: 50, null: false
    t.boolean  "is_active",             null: false
  end

  add_index "user_feature_location", ["slug"], name: "user_feature_location_slug_key", unique: true, using: :btree
  add_index "user_feature_location", ["slug"], name: "user_feature_location_slug_like", using: :btree

  create_table "user_feature_user", force: true do |t|
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.integer  "user_id",    null: false
    t.boolean  "always_on",  null: false
  end

  add_index "user_feature_user", ["user_id"], name: "user_feature_user_user_id_key", unique: true, using: :btree

  create_table "user_featureuser_locations", force: true do |t|
    t.integer "featureuser_id",     null: false
    t.integer "featurelocation_id", null: false
  end

  add_index "user_featureuser_locations", ["featurelocation_id"], name: "user_featureuser_locations_featurelocation_id", using: :btree
  add_index "user_featureuser_locations", ["featureuser_id", "featurelocation_id"], name: "user_featureuser_locations_featureuser_id_featurelocation_i_key", unique: true, using: :btree
  add_index "user_featureuser_locations", ["featureuser_id"], name: "user_featureuser_locations_featureuser_id", using: :btree

  create_table "user_featureuser_style", force: true do |t|
    t.integer "featureuser_id", null: false
    t.integer "style_id",       null: false
  end

  add_index "user_featureuser_style", ["featureuser_id", "style_id"], name: "user_featureuser_style_featureuser_id_style_id_key", unique: true, using: :btree
  add_index "user_featureuser_style", ["featureuser_id"], name: "user_featureuser_style_featureuser_id", using: :btree
  add_index "user_featureuser_style", ["style_id"], name: "user_featureuser_style_style_id", using: :btree

  create_table "user_featureuser_style_groups", force: true do |t|
    t.integer "featureuser_id", null: false
    t.integer "stylegroup_id",  null: false
  end

  add_index "user_featureuser_style_groups", ["featureuser_id", "stylegroup_id"], name: "user_featureuser_style_groups_featureuser_id_stylegroup_id_key", unique: true, using: :btree
  add_index "user_featureuser_style_groups", ["featureuser_id"], name: "user_featureuser_style_groups_featureuser_id", using: :btree
  add_index "user_featureuser_style_groups", ["stylegroup_id"], name: "user_featureuser_style_groups_stylegroup_id", using: :btree

  create_table "user_follow", force: true do |t|
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.integer  "user_id",    null: false
    t.integer  "target_id",  null: false
    t.datetime "deleted_at"
  end

  add_index "user_follow", ["target_id"], name: "user_follow_target_id", using: :btree
  add_index "user_follow", ["user_id", "target_id"], name: "user_follow_user_id_target_id_key", unique: true, using: :btree
  add_index "user_follow", ["user_id"], name: "user_follow_user_id", using: :btree

  create_table "user_last_login", primary_key: "user_id", force: true do |t|
    t.date    "created_at",     null: false
    t.integer "api_partner_id"
  end

  add_index "user_last_login", ["created_at", "user_id", "api_partner_id"], name: "user_last_login_created_at_user_id_api_partner_id_key", unique: true, using: :btree

  create_table "user_mail_stat", force: true do |t|
    t.datetime "updated_at",  null: false
    t.datetime "created_at",  null: false
    t.string   "type",        null: false
    t.integer  "emails_sent", null: false
  end

  create_table "user_mailredirect", force: true do |t|
    t.string   "url",                    limit: 200, null: false
    t.integer  "visits",                             null: false
    t.string   "view_name",              limit: 200, null: false
    t.datetime "first_visit"
    t.datetime "last_visit"
    t.integer  "communication_queue_id",             null: false
  end

  add_index "user_mailredirect", ["communication_queue_id"], name: "user_mailredirect_communication_queue_id", using: :btree
  add_index "user_mailredirect", ["view_name"], name: "user_mailredirect_view_name", using: :btree
  add_index "user_mailredirect", ["view_name"], name: "user_mailredirect_view_name_like", using: :btree

  create_table "user_notification_log", force: true do |t|
    t.datetime "updated_at",   null: false
    t.datetime "created_at",   null: false
    t.integer  "user_id",      null: false
    t.integer  "verb_id",      null: false
    t.datetime "published_at", null: false
    t.text     "message"
    t.text     "device_ids"
    t.boolean  "success",      null: false
  end

  add_index "user_notification_log", ["published_at"], name: "user_notification_log_published_at", using: :btree
  add_index "user_notification_log", ["user_id"], name: "user_notification_log_user_id", using: :btree

  create_table "user_open_graph_share", force: true do |t|
    t.integer  "user_id",                    null: false
    t.string   "action_domain",              null: false
    t.integer  "facebook_user_id", limit: 8, null: false
    t.text     "share_dict"
    t.integer  "content_type_id"
    t.integer  "object_id"
    t.text     "error_message"
    t.datetime "last_attempt"
    t.integer  "retry_count"
    t.string   "share_id"
    t.datetime "completed_at"
    t.datetime "removed_at"
    t.datetime "updated_at",                 null: false
    t.datetime "created_at",                 null: false
  end

  add_index "user_open_graph_share", ["content_type_id"], name: "user_open_graph_share_content_type_id", using: :btree
  add_index "user_open_graph_share", ["created_at"], name: "user_open_graph_share_created_at", using: :btree
  add_index "user_open_graph_share", ["user_id"], name: "user_open_graph_share_user_id", using: :btree

  create_table "user_profile", force: true do |t|
    t.text     "about_me"
    t.integer  "facebook_id",                    limit: 8
    t.text     "access_token"
    t.string   "facebook_name"
    t.text     "facebook_profile_url"
    t.text     "website_url"
    t.text     "blog_url"
    t.date     "date_of_birth"
    t.string   "gender",                         limit: 1
    t.text     "raw_data"
    t.boolean  "facebook_open_graph"
    t.boolean  "new_token_required",                         null: false
    t.integer  "user_id",                                    null: false
    t.boolean  "indexable",                                  null: false
    t.boolean  "welcome_closed",                             null: false
    t.boolean  "progress_closed",                            null: false
    t.string   "country",                        limit: 2
    t.string   "city",                           limit: 160
    t.datetime "updated_at"
    t.integer  "width"
    t.integer  "height"
    t.string   "image",                          limit: 100
    t.integer  "image_crop_x"
    t.integer  "image_crop_y"
    t.integer  "image_crop_width"
    t.integer  "image_crop_height"
    t.string   "header_image",                   limit: 100
    t.integer  "header_image_crop_x"
    t.integer  "header_image_crop_y"
    t.integer  "header_image_crop_width"
    t.integer  "header_image_crop_height"
    t.boolean  "image_on_cdn",                               null: false
    t.text     "facebook_display_url"
    t.string   "twitter_username"
    t.integer  "wordpress_author_id"
    t.boolean  "mailinglist",                                null: false
    t.integer  "love_count",                                 null: false
    t.integer  "item_count",                                 null: false
    t.integer  "influence_count",                            null: false
    t.integer  "recent_influence",                           null: false
    t.float    "new_total_influence",                        null: false
    t.float    "new_recent_influence",                       null: false
    t.float    "find_influence",                             null: false
    t.float    "love_influence",                             null: false
    t.integer  "list_count",                                 null: false
    t.integer  "follower_count",                             null: false
    t.integer  "following_count",                            null: false
    t.integer  "invite_count",                               null: false
    t.boolean  "featured",                                   null: false
    t.integer  "status"
    t.datetime "suggested_user_list_last_build"
    t.integer  "bounce_type"
    t.datetime "last_bounce_at"
    t.text     "last_bounce_raw_data"
    t.integer  "user_group_id"
    t.boolean  "disable_all_mail"
    t.datetime "last_email_open_at"
    t.string   "feed_type_default",              limit: 1
    t.boolean  "is_event_special"
  end

  add_index "user_profile", ["facebook_id"], name: "user_profile_facebook_id_key", unique: true, using: :btree
  add_index "user_profile", ["influence_count"], name: "user_profile_influence_count", using: :btree
  add_index "user_profile", ["user_group_id"], name: "user_profile_user_group_id", using: :btree
  add_index "user_profile", ["user_id"], name: "user_profile_user_id_key", unique: true, using: :btree

  create_table "user_profile_blog", force: true do |t|
    t.datetime "updated_at",                 null: false
    t.datetime "created_at",                 null: false
    t.integer  "profile_id",                 null: false
    t.string   "blog_name"
    t.text     "blog_url"
    t.text     "feed_url"
    t.string   "language",       limit: 5
    t.integer  "visitors"
    t.integer  "width"
    t.integer  "height"
    t.string   "image",          limit: 100
    t.boolean  "approved",                   null: false
    t.boolean  "image_approved",             null: false
  end

  add_index "user_profile_blog", ["profile_id"], name: "user_profile_blog_profile_id_key", unique: true, using: :btree

  create_table "user_profile_header", force: true do |t|
    t.integer "profile_id",              null: false
    t.text    "content"
    t.integer "width"
    t.integer "height"
    t.string  "image",       limit: 100
    t.text    "image_url"
    t.integer "width_2"
    t.integer "height_2"
    t.string  "image_2",     limit: 100
    t.text    "image_url_2"
  end

  add_index "user_profile_header", ["profile_id"], name: "user_profile_header_profile_id_key", unique: true, using: :btree

  create_table "user_registration_source", force: true do |t|
    t.datetime "updated_at",   null: false
    t.datetime "created_at",   null: false
    t.integer  "user_id",      null: false
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.text     "referer"
    t.text     "last_page"
  end

  add_index "user_registration_source", ["user_id"], name: "user_registration_source_user_id_key", unique: true, using: :btree

  create_table "user_status", force: true do |t|
    t.datetime "updated_at",       null: false
    t.datetime "created_at",       null: false
    t.integer  "user_id",          null: false
    t.text     "message",          null: false
    t.integer  "type_id",          null: false
    t.boolean  "staff_only",       null: false
    t.integer  "score"
    t.integer  "event_history_id", null: false
  end

  add_index "user_status", ["event_history_id"], name: "user_status_event_history_id", using: :btree
  add_index "user_status", ["type_id"], name: "user_status_type_id", using: :btree
  add_index "user_status", ["user_id"], name: "user_status_user_id", using: :btree

  create_table "user_status_type", force: true do |t|
    t.datetime "updated_at",                 null: false
    t.datetime "created_at",                 null: false
    t.string   "name",                       null: false
    t.string   "slug",            limit: 50, null: false
    t.datetime "message_read_at"
  end

  add_index "user_status_type", ["slug"], name: "user_status_type_slug_key", unique: true, using: :btree
  add_index "user_status_type", ["slug"], name: "user_status_type_slug_like", using: :btree

  create_table "user_stringcheck", force: true do |t|
    t.string   "string",               limit: 75, null: false
    t.integer  "type",                            null: false
    t.boolean  "used",                            null: false
    t.string   "usage_description",    limit: 75
    t.string   "creation_description"
    t.datetime "created_at",                      null: false
  end

  create_table "user_tagmatch", force: true do |t|
    t.integer "usersuggestion_id", null: false
    t.integer "tag_id",            null: false
  end

  add_index "user_tagmatch", ["tag_id"], name: "user_tagmatch_tag_id", using: :btree
  add_index "user_tagmatch", ["usersuggestion_id"], name: "user_tagmatch_usersuggestion_id", using: :btree

  create_table "user_user_delete_request", force: true do |t|
    t.datetime "updated_at",                         null: false
    t.datetime "created_at",                         null: false
    t.integer  "user_id",                            null: false
    t.string   "denormalized_username"
    t.string   "denormalized_user_email", limit: 75
    t.text     "reason"
  end

  add_index "user_user_delete_request", ["user_id"], name: "user_user_delete_request_user_id", using: :btree

  create_table "user_user_device", force: true do |t|
    t.datetime "updated_at",       null: false
    t.datetime "created_at",       null: false
    t.integer  "user_id",          null: false
    t.integer  "device_type"
    t.string   "device_id"
    t.string   "device_gcm_token"
  end

  add_index "user_user_device", ["user_id", "device_id"], name: "user_user_device_user_id_device_id_key", unique: true, using: :btree
  add_index "user_user_device", ["user_id"], name: "user_user_device_user_id", using: :btree

  create_table "user_user_group", force: true do |t|
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.integer  "user_id",    null: false
    t.string   "slug",       null: false
    t.integer  "order",      null: false
  end

  add_index "user_user_group", ["slug"], name: "user_user_group_slug", using: :btree
  add_index "user_user_group", ["slug"], name: "user_user_group_slug_like", using: :btree
  add_index "user_user_group", ["user_id", "slug"], name: "user_user_group_user_id_slug_key", unique: true, using: :btree
  add_index "user_user_group", ["user_id"], name: "user_user_group_user_id", using: :btree

  create_table "user_user_notification_setting", force: true do |t|
    t.datetime "updated_at",    null: false
    t.datetime "created_at",    null: false
    t.integer  "user_id",       null: false
    t.integer  "verb_id",       null: false
    t.boolean  "enabled",       null: false
    t.boolean  "notify_mobile", null: false
  end

  add_index "user_user_notification_setting", ["user_id", "verb_id"], name: "user_user_notification_setting_user_id_verb_id_key", unique: true, using: :btree
  add_index "user_user_notification_setting", ["user_id"], name: "user_user_notification_setting_user_id", using: :btree

  create_table "user_user_preference", force: true do |t|
    t.datetime "updated_at",  null: false
    t.datetime "created_at",  null: false
    t.integer  "category_id", null: false
    t.integer  "user_id",     null: false
    t.boolean  "enabled",     null: false
  end

  add_index "user_user_preference", ["category_id", "user_id"], name: "user_user_preference_category_id_user_id_key", unique: true, using: :btree
  add_index "user_user_preference", ["category_id"], name: "user_user_preference_category_id", using: :btree
  add_index "user_user_preference", ["user_id"], name: "user_user_preference_user_id", using: :btree

  create_table "user_user_style", force: true do |t|
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.integer  "user_id",    null: false
    t.integer  "style_id",   null: false
  end

  add_index "user_user_style", ["style_id"], name: "user_user_style_style_id", using: :btree
  add_index "user_user_style", ["user_id"], name: "user_user_style_user_id", using: :btree

  create_table "user_user_suggestion", force: true do |t|
    t.datetime "updated_at",        null: false
    t.datetime "created_at",        null: false
    t.integer  "user_id",           null: false
    t.integer  "suggested_user_id", null: false
    t.boolean  "accepted",          null: false
    t.boolean  "discarded",         null: false
    t.integer  "rank",              null: false
    t.integer  "source"
  end

  add_index "user_user_suggestion", ["suggested_user_id"], name: "user_user_suggestion_suggested_user_id", using: :btree
  add_index "user_user_suggestion", ["user_id", "suggested_user_id"], name: "user_user_suggestion_user_id_suggested_user_id_key", unique: true, using: :btree
  add_index "user_user_suggestion", ["user_id"], name: "user_user_suggestion_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                                null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
