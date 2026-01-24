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

ActiveRecord::Schema[8.0].define(version: 2026_01_24_185411) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "commands", force: :cascade do |t|
    t.integer "Device_id", null: false
    t.datetime "trigger_time"
    t.string "command"
    t.string "commandtype"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
    t.index ["Device_id"], name: "index_commands_on_Device_id"
  end

  create_table "device_states", force: :cascade do |t|
    t.integer "Device_id"
    t.string "version", default: ""
    t.boolean "armed", default: false
    t.boolean "prearmed", default: false
    t.string "mode", default: ""
    t.string "status", default: ""
    t.decimal "latitude1", default: "51.0475"
    t.decimal "longitude1", default: "-114.068889"
    t.string "gps1_status", default: ""
    t.integer "gps1_timestamp"
    t.integer "satcount1"
    t.float "gps1_altitude"
    t.float "gps1_speed"
    t.float "gps1_heading"
    t.float "gps1_hdop"
    t.string "gps1_fix_type", default: ""
    t.decimal "latitude2", default: "51.0475"
    t.decimal "longitude2", default: "-114.068889"
    t.string "gps2_status", default: ""
    t.integer "gps2_timestamp"
    t.integer "satcount2"
    t.float "gps2_altitude"
    t.float "gps2_speed"
    t.float "gps2_heading"
    t.float "gps2_hdop"
    t.string "gps2_fix_type", default: ""
    t.float "vibex"
    t.float "vibey"
    t.float "vibez"
    t.float "heading_deg"
    t.float "roll_deg"
    t.float "yaw_deg"
    t.boolean "landed"
    t.integer "landed_state"
    t.float "timeInAir"
    t.boolean "extended1", default: false
    t.boolean "extend1", default: false
    t.boolean "extended2", default: false
    t.boolean "extend2", default: false
    t.boolean "maglock", default: false
    t.boolean "laser", default: false
    t.boolean "headlight", default: false
    t.boolean "spotlight", default: false
    t.float "ax1"
    t.float "ay1"
    t.float "az1"
    t.float "ax2"
    t.float "ay2"
    t.float "az2"
    t.float "ax3"
    t.float "ay3"
    t.float "az3"
    t.float "vx"
    t.float "vy"
    t.float "vz"
    t.float "imu1_temp_c"
    t.float "imu2_temp_c"
    t.float "imu3_temp_c"
    t.float "gimbal_heading_deg"
    t.float "gimbal_tilt_deg"
    t.float "gimbal_yaw_deg"
    t.float "gimbal_target_heading_deg"
    t.float "gimbal_target_tilt_deg"
    t.float "gimbal_target_yaw_deg"
    t.float "nav_bearing"
    t.float "nav_pitch"
    t.float "nav_roll"
    t.float "magnetic_x"
    t.float "magnetic_y"
    t.float "magnetic_z"
    t.float "sonar_range_m"
    t.float "sonar_v"
    t.boolean "terrainactive"
    t.boolean "safetyactive"
    t.boolean "failsafe"
    t.float "temp1_c"
    t.float "temp2_c"
    t.float "temp3_c"
    t.float "temp4_c"
    t.float "temp5_c"
    t.float "temp6_c"
    t.float "temp7_c"
    t.float "temp8_c"
    t.float "pressure_pa"
    t.float "airspeed"
    t.float "battery1_v"
    t.float "battery1_a"
    t.float "battery1_temp_c"
    t.float "battery1_percent"
    t.float "battery2_v"
    t.float "battery2_a"
    t.float "battery2_temp_c"
    t.float "battery2_percent"
    t.float "battery3_v"
    t.float "battery3_a"
    t.float "battery3_temp_c"
    t.float "battery3_percent"
    t.float "battery4_v"
    t.float "battery4_a"
    t.float "battery4_temp_c"
    t.float "battery4_percent"
    t.float "battery5_v"
    t.float "battery5_a"
    t.float "battery5_temp_c"
    t.float "battery5_percent"
    t.float "battery6_v"
    t.float "battery6_a"
    t.float "battery6_temp_c"
    t.float "battery6_percent"
    t.float "battery7_v"
    t.float "battery7_a"
    t.float "battery7_temp_c"
    t.float "battery7_percent"
    t.float "battery8_v"
    t.float "battery8_a"
    t.float "battery8_temp_c"
    t.float "battery8_percent"
    t.float "esc1_v"
    t.float "esc1_a"
    t.float "esc1_temp_c"
    t.float "esc1_rpm"
    t.float "esc2_v"
    t.float "esc2_a"
    t.float "esc2_temp_c"
    t.float "esc2_rpm"
    t.float "esc3_v"
    t.float "esc3_a"
    t.float "esc3_temp_c"
    t.float "esc3_rpm"
    t.float "esc4_v"
    t.float "esc4_a"
    t.float "esc4_temp_c"
    t.float "esc4_rpm"
    t.float "esc5_v"
    t.float "esc5_a"
    t.float "esc5_temp_c"
    t.float "esc5_rpm"
    t.float "esc6_v"
    t.float "esc6_a"
    t.float "esc6_temp_c"
    t.float "esc6_rpm"
    t.float "esc7_v"
    t.float "esc7_a"
    t.float "esc7_temp_c"
    t.float "esc7_rpm"
    t.float "esc8_v"
    t.float "esc8_a"
    t.float "esc8_temp_c"
    t.float "esc8_rpm"
    t.float "esc9_v"
    t.float "esc9_a"
    t.float "esc9_temp_c"
    t.float "esc9_rpm"
    t.float "esc10_v"
    t.float "esc10_a"
    t.float "esc10_temp_c"
    t.float "esc10_rpm"
    t.float "esc11_v"
    t.float "esc11_a"
    t.float "esc11_temp_c"
    t.float "esc11_rpm"
    t.float "esc12_v"
    t.float "esc12_a"
    t.float "esc12_temp_c"
    t.float "esc12_rpm"
    t.float "esc13_v"
    t.float "esc13_a"
    t.float "esc13_temp_c"
    t.float "esc13_rpm"
    t.float "esc14_v"
    t.float "esc14_a"
    t.float "esc14_temp_c"
    t.float "esc14_rpm"
    t.float "esc15_v"
    t.float "esc15_a"
    t.float "esc15_temp_c"
    t.float "esc15_rpm"
    t.float "esc16_v"
    t.float "esc16_a"
    t.float "esc16_temp_c"
    t.float "esc16_rpm"
    t.float "efi_rpm"
    t.float "efi_fuel_pressure_bar"
    t.float "efi_intake_temp_c"
    t.float "efi_exhaust_temp_c"
    t.float "efi_fuel_flow_lps"
    t.float "efi_fuel_percent"
    t.float "efi_baro"
    t.float "efi_load"
    t.float "throttle_angle", default: 0.0
    t.float "brake_angle", default: 0.0
    t.float "steering_wheel_angle", default: 0.0
    t.integer "turn_signal", default: 0
    t.boolean "xpdr_adsb_tx_sys_fail"
    t.boolean "xpdr_airborne_status"
    t.float "xpdr_board_temperature_c"
    t.boolean "xpdr_es1090_tx_enable"
    t.string "xpdr_flight_id", default: ""
    t.boolean "xpdr_gps_no_fix"
    t.boolean "xpdr_gps_unavail"
    t.boolean "xpdr_ident_active"
    t.boolean "xpdr_interrogated_since"
    t.boolean "xpdr_maint_req"
    t.boolean "xpdr_mode_A_enable"
    t.integer "xpdr_mode_A_squawk"
    t.boolean "xpdr_mode_C_enable"
    t.boolean "xpdr_mode_S_enable"
    t.integer "xpdr_nacp"
    t.integer "xpdr_nic"
    t.boolean "xpdr_status_pending"
    t.boolean "xpdr_status_unavail"
    t.boolean "xpdr_x_bit_status"
    t.integer "cell_rssi_dbm"
    t.integer "cell_rsrp"
    t.integer "cell_rsrq"
    t.integer "cell_sinr"
    t.string "cell_network_type", default: ""
    t.string "cell_id", default: ""
    t.string "cell_connection_state", default: ""
    t.string "cell_network_registration_state", default: ""
    t.integer "cell_retry_count"
    t.integer "cell_latency_ms"
    t.string "cell_ip", default: ""
    t.integer "cell_network_bytes_sent"
    t.integer "cell_network_bytes_recevied"
    t.integer "cell_network_bps_up"
    t.integer "cell_network_bps_down"
    t.string "wifi_ssid", default: ""
    t.string "wifi_bssid", default: ""
    t.integer "wifi_rssi_dbm"
    t.integer "wifi_snr_db"
    t.integer "wifi_link_speed_mbps"
    t.string "wifi_band", default: ""
    t.integer "wifi_channel"
    t.string "wifi_ip_address", default: ""
    t.string "wifi_connection_status", default: ""
    t.integer "wifi_uptime_sec"
    t.integer "wifi_bytes_sent"
    t.integer "wifi_bytes_received"
    t.string "mac_address", default: ""
    t.string "ethernet_link_status", default: ""
    t.string "ethernet_speed", default: ""
    t.string "ip_address", default: ""
    t.string "subnet_mask", default: ""
    t.string "default_gateway", default: ""
    t.string "dhcp_status", default: ""
    t.string "dhcp_lease", default: ""
    t.float "ham_radio_rx_hz"
    t.float "ham_radio_tx_hz"
    t.float "ham_radio_watts"
    t.boolean "ham_radio_enable"
    t.float "ham_radio_v"
    t.float "ham_radio_a"
    t.float "heater1_v"
    t.float "heater1_a"
    t.float "heater1_temp_c"
    t.float "heater2_v"
    t.float "heater2_a"
    t.float "heater2_temp_c"
    t.float "heater3_v"
    t.float "heater3_a"
    t.float "heater3_temp_c"
    t.float "heater4_v"
    t.float "heater4_a"
    t.float "heater4_temp_c"
    t.float "humidity1"
    t.float "humidity2"
    t.float "fan1_v"
    t.float "fan1_a"
    t.float "fan1_rpm"
    t.float "fan2_v"
    t.float "fan2_a"
    t.float "fan2_rpm"
    t.float "rangefinder1_m"
    t.float "rangefinder2_m"
    t.float "rangefinder3_m"
    t.float "rangefinder4_m"
    t.float "rangefinder5_m"
    t.float "rangefinder6_m"
    t.float "rangefinder7_m"
    t.float "rangefinder8_m"
    t.float "solar1_v"
    t.float "solar1_a"
    t.float "solar2_v"
    t.float "solar2_a"
    t.float "charge_v"
    t.float "charge_a"
    t.integer "mag1", default: 0
    t.integer "mag2", default: 0
    t.integer "mag3", default: 0
    t.integer "mag4", default: 0
    t.boolean "button1"
    t.boolean "button2"
    t.boolean "switch1"
    t.boolean "switch2"
    t.float "load_cell1_n"
    t.float "load_cell2_n"
    t.float "load_cell3_n"
    t.float "load_cell4_n"
    t.float "current_sensor1_ma"
    t.float "current_sensor2_ma"
    t.float "current_sensor3_ma"
    t.float "current_sensor4_ma"
    t.float "current_sensor5_ma"
    t.float "current_sensor6_ma"
    t.float "current_sensor7_ma"
    t.float "current_sensor8_ma"
    t.float "voltage_sensor1_mv"
    t.float "voltage_sensor2_mv"
    t.float "voltage_sensor3_mv"
    t.float "voltage_sensor4_mv"
    t.float "voltage_sensor5_mv"
    t.float "voltage_sensor6_mv"
    t.float "voltage_sensor7_mv"
    t.float "voltage_sensor9_mv"
    t.boolean "digital_output1", default: false
    t.boolean "digital_output2", default: false
    t.boolean "digital_output3", default: false
    t.boolean "digital_output4", default: false
    t.boolean "digital_output5", default: false
    t.boolean "digital_output6", default: false
    t.boolean "digital_output7", default: false
    t.boolean "digital_output8", default: false
    t.boolean "digital_input1"
    t.boolean "digital_input2"
    t.boolean "digital_input3"
    t.boolean "digital_input4"
    t.boolean "digital_input5"
    t.boolean "digital_input6"
    t.boolean "digital_input7"
    t.boolean "digital_input8"
    t.float "analog_output1", default: 0.0
    t.float "analog_output2", default: 0.0
    t.float "analog_output3", default: 0.0
    t.float "analog_output4", default: 0.0
    t.float "analog_output5", default: 0.0
    t.float "analog_output6", default: 0.0
    t.float "analog_output7", default: 0.0
    t.float "analog_output8", default: 0.0
    t.float "hall1_angle_degrees"
    t.float "hall2_angle_degrees"
    t.float "hall3_angle_degrees"
    t.float "hall4_angle_degrees"
    t.float "hall5_angle_degrees"
    t.float "hall6_angle_degrees"
    t.float "hall7_angle_degrees"
    t.float "hall8_angle_degrees"
    t.boolean "hall1_presence"
    t.boolean "hall2_presence"
    t.boolean "hall3_presence"
    t.boolean "hall4_presence"
    t.boolean "hall5_presence"
    t.boolean "hall6_presence"
    t.boolean "hall7_presence"
    t.boolean "hall8_presence"
    t.float "geiger_mrad"
    t.float "color_r"
    t.float "color_g"
    t.float "color_b"
    t.string "text1", default: ""
    t.string "text2", default: ""
    t.string "text3", default: ""
    t.string "text4", default: ""
    t.string "text5", default: ""
    t.string "text6", default: ""
    t.string "text7", default: ""
    t.string "text8", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Device_id", "created_at"], name: "index_device_states_on_device_id_and_created_at"
    t.index ["Device_id"], name: "index_device_states_on_Device_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_devices_on_state_id"
  end

  create_table "photographs", force: :cascade do |t|
    t.integer "Device_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Device_id"], name: "index_photographs_on_Device_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "commands", "Devices"
  add_foreign_key "device_states", "Devices"
  add_foreign_key "devices", "device_states", column: "state_id"
  add_foreign_key "photographs", "Devices"
end
