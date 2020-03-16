#管理者
create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
  expose :name",              null: false, default: ""
  expose :email",              null: false, default: ""
  expose :encrypted_password", null: false, default: ""
  t.datetime "remember_created_at"
end
#一般ユーザー
create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci"  do |t|
  # Device関連
  t.string "provider",           null: false, default: "email"
  t.string "uid",                null: false, default: ""
  t.text :tokens
  t.string "email",              null: false, default: ""
  t.string "encrypted_password", null: false, default: ""
  t.string "reset_password_token"
  t.datetime "reset_password_sent_at"
  t.datetime "remember_created_at"
  t.integer "sign_in_count", default: 0, null: false
  t.datetime "current_sign_in_at"
  t.datetime "last_sign_in_at"
  t.string "current_sign_in_ip"
  t.string "last_sign_in_ip"
  t.string "confirmation_token"
  t.datetime "confirmed_at"
  t.datetime "confirmation_sent_at"
  t.string "unconfirmed_email"
  t.integer "failed_attempts", default: 0, null: false
  t.string "unlock_token"
  t.datetime "locked_at"
  t.timestamps null: false
  # Push通知関連
  t.string :endpoint_arn
  t.string :device_token
  t.string :mobile_os
  t.string "phone_number"
  t.string "nickname"
  t.integer "gender"
  t.date "date_of_birth"
  t.integer "come_from"
  t.integer "residence"
  t.string "full_name"
  t.string "alphabet_full_name"
  t.integer "school_id"
  t.integer "temporary_school_id"
  t.datetime "online_at"
  t.datetime "offline_at"
  t.boolean "introduce_user", null: false, default: false
end
add_index :users, :email,                unique: true
add_index :users, :reset_password_token, unique: true
add_index :users, :confirmation_token,   unique: true
add_index :users, :unlock_token,         unique: true
