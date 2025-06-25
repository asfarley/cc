require "application_system_test_case"

class DeviceStatesTest < ApplicationSystemTestCase
  setup do
    @device_state = device_states(:one)
  end

  test "visiting the index" do
    visit device_states_url
    assert_selector "h1", text: "Device states"
  end

  test "should create device state" do
    visit device_states_url
    click_on "New device state"

    fill_in "Device", with: @device_state.Device_id
    fill_in "Airspeed", with: @device_state.airspeed
    fill_in "Analog output1", with: @device_state.analog_output1
    fill_in "Analog output2", with: @device_state.analog_output2
    fill_in "Analog output3", with: @device_state.analog_output3
    fill_in "Analog output4", with: @device_state.analog_output4
    fill_in "Analog output5", with: @device_state.analog_output5
    fill_in "Analog output6", with: @device_state.analog_output6
    fill_in "Analog output7", with: @device_state.analog_output7
    fill_in "Analog output8", with: @device_state.analog_output8
    check "Armed" if @device_state.armed
    fill_in "Ax1", with: @device_state.ax1
    fill_in "Ax2", with: @device_state.ax2
    fill_in "Ax3", with: @device_state.ax3
    fill_in "Ay1", with: @device_state.ay1
    fill_in "Ay2", with: @device_state.ay2
    fill_in "Ay3", with: @device_state.ay3
    fill_in "Az1", with: @device_state.az1
    fill_in "Az2", with: @device_state.az2
    fill_in "Az3", with: @device_state.az3
    fill_in "Battery1 a", with: @device_state.battery1_a
    fill_in "Battery1 percent", with: @device_state.battery1_percent
    fill_in "Battery1 temp c", with: @device_state.battery1_temp_c
    fill_in "Battery1 v", with: @device_state.battery1_v
    fill_in "Battery2 a", with: @device_state.battery2_a
    fill_in "Battery2 percent", with: @device_state.battery2_percent
    fill_in "Battery2 temp c", with: @device_state.battery2_temp_c
    fill_in "Battery2 v", with: @device_state.battery2_v
    fill_in "Battery3 a", with: @device_state.battery3_a
    fill_in "Battery3 percent", with: @device_state.battery3_percent
    fill_in "Battery3 temp c", with: @device_state.battery3_temp_c
    fill_in "Battery3 v", with: @device_state.battery3_v
    fill_in "Battery4 a", with: @device_state.battery4_a
    fill_in "Battery4 percent", with: @device_state.battery4_percent
    fill_in "Battery4 temp c", with: @device_state.battery4_temp_c
    fill_in "Battery4 v", with: @device_state.battery4_v
    fill_in "Battery5 a", with: @device_state.battery5_a
    fill_in "Battery5 percent", with: @device_state.battery5_percent
    fill_in "Battery5 temp c", with: @device_state.battery5_temp_c
    fill_in "Battery5 v", with: @device_state.battery5_v
    fill_in "Battery6 a", with: @device_state.battery6_a
    fill_in "Battery6 percent", with: @device_state.battery6_percent
    fill_in "Battery6 temp c", with: @device_state.battery6_temp_c
    fill_in "Battery6 v", with: @device_state.battery6_v
    fill_in "Battery7 a", with: @device_state.battery7_a
    fill_in "Battery7 percent", with: @device_state.battery7_percent
    fill_in "Battery7 temp c", with: @device_state.battery7_temp_c
    fill_in "Battery7 v", with: @device_state.battery7_v
    fill_in "Battery8 a", with: @device_state.battery8_a
    fill_in "Battery8 percent", with: @device_state.battery8_percent
    fill_in "Battery8 temp c", with: @device_state.battery8_temp_c
    fill_in "Battery8 v", with: @device_state.battery8_v
    fill_in "Brake angle", with: @device_state.brake_angle
    check "Button1" if @device_state.button1
    check "Button2" if @device_state.button2
    fill_in "Cell connection state", with: @device_state.cell_connection_state
    fill_in "Cell", with: @device_state.cell_id
    fill_in "Cell ip", with: @device_state.cell_ip
    fill_in "Cell latency ms", with: @device_state.cell_latency_ms
    fill_in "Cell network bps down", with: @device_state.cell_network_bps_down
    fill_in "Cell network bps up", with: @device_state.cell_network_bps_up
    fill_in "Cell network bytes recevied", with: @device_state.cell_network_bytes_recevied
    fill_in "Cell network bytes sent", with: @device_state.cell_network_bytes_sent
    fill_in "Cell network registration state", with: @device_state.cell_network_registration_state
    fill_in "Cell network type", with: @device_state.cell_network_type
    fill_in "Cell retry count", with: @device_state.cell_retry_count
    fill_in "Cell rsrp", with: @device_state.cell_rsrp
    fill_in "Cell rsrq", with: @device_state.cell_rsrq
    fill_in "Cell rssi dbm", with: @device_state.cell_rssi_dbm
    fill_in "Cell sinr", with: @device_state.cell_sinr
    fill_in "Charge a", with: @device_state.charge_a
    fill_in "Charge v", with: @device_state.charge_v
    fill_in "Color b", with: @device_state.color_b
    fill_in "Color g", with: @device_state.color_g
    fill_in "Color r", with: @device_state.color_r
    fill_in "Current sensor1 ma", with: @device_state.current_sensor1_ma
    fill_in "Current sensor2 ma", with: @device_state.current_sensor2_ma
    fill_in "Current sensor3 ma", with: @device_state.current_sensor3_ma
    fill_in "Current sensor4 ma", with: @device_state.current_sensor4_ma
    fill_in "Current sensor5 ma", with: @device_state.current_sensor5_ma
    fill_in "Current sensor6 ma", with: @device_state.current_sensor6_ma
    fill_in "Current sensor7 ma", with: @device_state.current_sensor7_ma
    fill_in "Current sensor8 ma", with: @device_state.current_sensor8_ma
    fill_in "Default gateway", with: @device_state.default_gateway
    fill_in "Dhcp lease", with: @device_state.dhcp_lease
    fill_in "Dhcp status", with: @device_state.dhcp_status
    check "Digital input1" if @device_state.digital_input1
    check "Digital input2" if @device_state.digital_input2
    check "Digital input3" if @device_state.digital_input3
    check "Digital input4" if @device_state.digital_input4
    check "Digital input5" if @device_state.digital_input5
    check "Digital input6" if @device_state.digital_input6
    check "Digital input7" if @device_state.digital_input7
    check "Digital input8" if @device_state.digital_input8
    check "Digital output1" if @device_state.digital_output1
    check "Digital output2" if @device_state.digital_output2
    check "Digital output3" if @device_state.digital_output3
    check "Digital output4" if @device_state.digital_output4
    check "Digital output5" if @device_state.digital_output5
    check "Digital output6" if @device_state.digital_output6
    check "Digital output7" if @device_state.digital_output7
    check "Digital output8" if @device_state.digital_output8
    fill_in "Efi baro", with: @device_state.efi_baro
    fill_in "Efi exhaust temp c", with: @device_state.efi_exhaust_temp_c
    fill_in "Efi fuel flow lps", with: @device_state.efi_fuel_flow_lps
    fill_in "Efi fuel percent", with: @device_state.efi_fuel_percent
    fill_in "Efi fuel pressure bar", with: @device_state.efi_fuel_pressure_bar
    fill_in "Efi intake temp c", with: @device_state.efi_intake_temp_c
    fill_in "Efi load", with: @device_state.efi_load
    fill_in "Efi rpm", with: @device_state.efi_rpm
    fill_in "Esc10 a", with: @device_state.esc10_a
    fill_in "Esc10 rpm", with: @device_state.esc10_rpm
    fill_in "Esc10 temp c", with: @device_state.esc10_temp_c
    fill_in "Esc10 v", with: @device_state.esc10_v
    fill_in "Esc11 a", with: @device_state.esc11_a
    fill_in "Esc11 rpm", with: @device_state.esc11_rpm
    fill_in "Esc11 temp c", with: @device_state.esc11_temp_c
    fill_in "Esc11 v", with: @device_state.esc11_v
    fill_in "Esc12 a", with: @device_state.esc12_a
    fill_in "Esc12 rpm", with: @device_state.esc12_rpm
    fill_in "Esc12 temp c", with: @device_state.esc12_temp_c
    fill_in "Esc12 v", with: @device_state.esc12_v
    fill_in "Esc13 a", with: @device_state.esc13_a
    fill_in "Esc13 rpm", with: @device_state.esc13_rpm
    fill_in "Esc13 temp c", with: @device_state.esc13_temp_c
    fill_in "Esc13 v", with: @device_state.esc13_v
    fill_in "Esc14 a", with: @device_state.esc14_a
    fill_in "Esc14 rpm", with: @device_state.esc14_rpm
    fill_in "Esc14 temp c", with: @device_state.esc14_temp_c
    fill_in "Esc14 v", with: @device_state.esc14_v
    fill_in "Esc15 a", with: @device_state.esc15_a
    fill_in "Esc15 rpm", with: @device_state.esc15_rpm
    fill_in "Esc15 temp c", with: @device_state.esc15_temp_c
    fill_in "Esc15 v", with: @device_state.esc15_v
    fill_in "Esc16 a", with: @device_state.esc16_a
    fill_in "Esc16 rpm", with: @device_state.esc16_rpm
    fill_in "Esc16 temp c", with: @device_state.esc16_temp_c
    fill_in "Esc16 v", with: @device_state.esc16_v
    fill_in "Esc1 a", with: @device_state.esc1_a
    fill_in "Esc1 rpm", with: @device_state.esc1_rpm
    fill_in "Esc1 temp c", with: @device_state.esc1_temp_c
    fill_in "Esc1 v", with: @device_state.esc1_v
    fill_in "Esc2 a", with: @device_state.esc2_a
    fill_in "Esc2 rpm", with: @device_state.esc2_rpm
    fill_in "Esc2 temp c", with: @device_state.esc2_temp_c
    fill_in "Esc2 v", with: @device_state.esc2_v
    fill_in "Esc3 a", with: @device_state.esc3_a
    fill_in "Esc3 rpm", with: @device_state.esc3_rpm
    fill_in "Esc3 temp c", with: @device_state.esc3_temp_c
    fill_in "Esc3 v", with: @device_state.esc3_v
    fill_in "Esc4 a", with: @device_state.esc4_a
    fill_in "Esc4 rpm", with: @device_state.esc4_rpm
    fill_in "Esc4 temp c", with: @device_state.esc4_temp_c
    fill_in "Esc4 v", with: @device_state.esc4_v
    fill_in "Esc5 a", with: @device_state.esc5_a
    fill_in "Esc5 rpm", with: @device_state.esc5_rpm
    fill_in "Esc5 temp c", with: @device_state.esc5_temp_c
    fill_in "Esc5 v", with: @device_state.esc5_v
    fill_in "Esc6 a", with: @device_state.esc6_a
    fill_in "Esc6 rpm", with: @device_state.esc6_rpm
    fill_in "Esc6 temp c", with: @device_state.esc6_temp_c
    fill_in "Esc6 v", with: @device_state.esc6_v
    fill_in "Esc7 a", with: @device_state.esc7_a
    fill_in "Esc7 rpm", with: @device_state.esc7_rpm
    fill_in "Esc7 temp c", with: @device_state.esc7_temp_c
    fill_in "Esc7 v", with: @device_state.esc7_v
    fill_in "Esc8 a", with: @device_state.esc8_a
    fill_in "Esc8 rpm", with: @device_state.esc8_rpm
    fill_in "Esc8 temp c", with: @device_state.esc8_temp_c
    fill_in "Esc8 v", with: @device_state.esc8_v
    fill_in "Esc9 a", with: @device_state.esc9_a
    fill_in "Esc9 rpm", with: @device_state.esc9_rpm
    fill_in "Esc9 temp c", with: @device_state.esc9_temp_c
    fill_in "Esc9 v", with: @device_state.esc9_v
    fill_in "Ethernet link status", with: @device_state.ethernet_link_status
    fill_in "Ethernet speed", with: @device_state.ethernet_speed
    check "Extend1" if @device_state.extend1
    check "Extend2" if @device_state.extend2
    check "Extended1" if @device_state.extended1
    check "Extended2" if @device_state.extended2
    check "Failsafe" if @device_state.failsafe
    fill_in "Fan1 a", with: @device_state.fan1_a
    fill_in "Fan1 rpm", with: @device_state.fan1_rpm
    fill_in "Fan1 v", with: @device_state.fan1_v
    fill_in "Fan2 a", with: @device_state.fan2_a
    fill_in "Fan2 rpm", with: @device_state.fan2_rpm
    fill_in "Fan2 v", with: @device_state.fan2_v
    fill_in "Geiger mrad", with: @device_state.geiger_mrad
    fill_in "Gimbal heading deg", with: @device_state.gimbal_heading_deg
    fill_in "Gimbal target heading deg", with: @device_state.gimbal_target_heading_deg
    fill_in "Gimbal target tilt deg", with: @device_state.gimbal_target_tilt_deg
    fill_in "Gimbal target yaw deg", with: @device_state.gimbal_target_yaw_deg
    fill_in "Gimbal tilt deg", with: @device_state.gimbal_tilt_deg
    fill_in "Gimbal yaw deg", with: @device_state.gimbal_yaw_deg
    fill_in "Gps1 altitude", with: @device_state.gps1_altitude
    fill_in "Gps1 fix type", with: @device_state.gps1_fix_type
    fill_in "Gps1 hdop", with: @device_state.gps1_hdop
    fill_in "Gps1 heading", with: @device_state.gps1_heading
    fill_in "Gps1 speed", with: @device_state.gps1_speed
    fill_in "Gps1 status", with: @device_state.gps1_status
    fill_in "Gps1 timestamp", with: @device_state.gps1_timestamp
    fill_in "Gps2 altitude", with: @device_state.gps2_altitude
    fill_in "Gps2 fix type", with: @device_state.gps2_fix_type
    fill_in "Gps2 hdop", with: @device_state.gps2_hdop
    fill_in "Gps2 heading", with: @device_state.gps2_heading
    fill_in "Gps2 speed", with: @device_state.gps2_speed
    fill_in "Gps2 status", with: @device_state.gps2_status
    fill_in "Gps2 timestamp", with: @device_state.gps2_timestamp
    fill_in "Hall1 angle degrees", with: @device_state.hall1_angle_degrees
    check "Hall1 presence" if @device_state.hall1_presence
    fill_in "Hall2 angle degrees", with: @device_state.hall2_angle_degrees
    check "Hall2 presence" if @device_state.hall2_presence
    fill_in "Hall3 angle degrees", with: @device_state.hall3_angle_degrees
    check "Hall3 presence" if @device_state.hall3_presence
    fill_in "Hall4 angle degrees", with: @device_state.hall4_angle_degrees
    check "Hall4 presence" if @device_state.hall4_presence
    fill_in "Hall5 angle degrees", with: @device_state.hall5_angle_degrees
    check "Hall5 presence" if @device_state.hall5_presence
    fill_in "Hall6 angle degrees", with: @device_state.hall6_angle_degrees
    check "Hall6 presence" if @device_state.hall6_presence
    fill_in "Hall7 angle degrees", with: @device_state.hall7_angle_degrees
    check "Hall7 presence" if @device_state.hall7_presence
    fill_in "Hall8 angle degrees", with: @device_state.hall8_angle_degrees
    check "Hall8 presence" if @device_state.hall8_presence
    fill_in "Ham radio a", with: @device_state.ham_radio_a
    check "Ham radio enable" if @device_state.ham_radio_enable
    fill_in "Ham radio rx hz", with: @device_state.ham_radio_rx_hz
    fill_in "Ham radio tx hz", with: @device_state.ham_radio_tx_hz
    fill_in "Ham radio v", with: @device_state.ham_radio_v
    fill_in "Ham radio watts", with: @device_state.ham_radio_watts
    fill_in "Heading deg", with: @device_state.heading_deg
    check "Headlight" if @device_state.headlight
    fill_in "Heater1 a", with: @device_state.heater1_a
    fill_in "Heater1 temp c", with: @device_state.heater1_temp_c
    fill_in "Heater1 v", with: @device_state.heater1_v
    fill_in "Heater2 a", with: @device_state.heater2_a
    fill_in "Heater2 temp c", with: @device_state.heater2_temp_c
    fill_in "Heater2 v", with: @device_state.heater2_v
    fill_in "Heater3 a", with: @device_state.heater3_a
    fill_in "Heater3 temp c", with: @device_state.heater3_temp_c
    fill_in "Heater3 v", with: @device_state.heater3_v
    fill_in "Heater4 a", with: @device_state.heater4_a
    fill_in "Heater4 temp c", with: @device_state.heater4_temp_c
    fill_in "Heater4 v", with: @device_state.heater4_v
    fill_in "Humidity1", with: @device_state.humidity1
    fill_in "Humidity2", with: @device_state.humidity2
    fill_in "Imu1 temp c", with: @device_state.imu1_temp_c
    fill_in "Imu2 temp c", with: @device_state.imu2_temp_c
    fill_in "Imu3 temp c", with: @device_state.imu3_temp_c
    fill_in "Ip address", with: @device_state.ip_address
    check "Landed" if @device_state.landed
    fill_in "Landed state", with: @device_state.landed_state
    check "Laser" if @device_state.laser
    fill_in "Latitude1", with: @device_state.latitude1
    fill_in "Latitude2", with: @device_state.latitude2
    fill_in "Load cell1 n", with: @device_state.load_cell1_n
    fill_in "Load cell2 n", with: @device_state.load_cell2_n
    fill_in "Load cell3 n", with: @device_state.load_cell3_n
    fill_in "Load cell4 n", with: @device_state.load_cell4_n
    fill_in "Longitude1", with: @device_state.longitude1
    fill_in "Longitude2", with: @device_state.longitude2
    fill_in "Mac address", with: @device_state.mac_address
    fill_in "Mag1", with: @device_state.mag1
    fill_in "Mag2", with: @device_state.mag2
    fill_in "Mag3", with: @device_state.mag3
    fill_in "Mag4", with: @device_state.mag4
    check "Maglock" if @device_state.maglock
    fill_in "Magnetic x", with: @device_state.magnetic_x
    fill_in "Magnetic y", with: @device_state.magnetic_y
    fill_in "Magnetic z", with: @device_state.magnetic_z
    fill_in "Mode", with: @device_state.mode
    fill_in "Nav bearing", with: @device_state.nav_bearing
    fill_in "Nav pitch", with: @device_state.nav_pitch
    fill_in "Nav roll", with: @device_state.nav_roll
    check "Prearmed" if @device_state.prearmed
    fill_in "Pressure pa", with: @device_state.pressure_pa
    fill_in "Rangefinder1 m", with: @device_state.rangefinder1_m
    fill_in "Rangefinder2 m", with: @device_state.rangefinder2_m
    fill_in "Rangefinder3 m", with: @device_state.rangefinder3_m
    fill_in "Rangefinder4 m", with: @device_state.rangefinder4_m
    fill_in "Rangefinder5 m", with: @device_state.rangefinder5_m
    fill_in "Rangefinder6 m", with: @device_state.rangefinder6_m
    fill_in "Rangefinder7 m", with: @device_state.rangefinder7_m
    fill_in "Rangefinder8 m", with: @device_state.rangefinder8_m
    fill_in "Roll deg", with: @device_state.roll_deg
    check "Safetyactive" if @device_state.safetyactive
    fill_in "Satcount1", with: @device_state.satcount1
    fill_in "Satcount2", with: @device_state.satcount2
    fill_in "Solar1 a", with: @device_state.solar1_a
    fill_in "Solar1 v", with: @device_state.solar1_v
    fill_in "Solar2 a", with: @device_state.solar2_a
    fill_in "Solar2 v", with: @device_state.solar2_v
    fill_in "Sonar range m", with: @device_state.sonar_range_m
    fill_in "Sonar v", with: @device_state.sonar_v
    check "Spotlight" if @device_state.spotlight
    fill_in "Status", with: @device_state.status
    fill_in "Steering wheel angle", with: @device_state.steering_wheel_angle
    fill_in "Subnet mask", with: @device_state.subnet_mask
    check "Switch1" if @device_state.switch1
    check "Switch2" if @device_state.switch2
    fill_in "Temp1 c", with: @device_state.temp1_c
    fill_in "Temp2 c", with: @device_state.temp2_c
    fill_in "Temp3 c", with: @device_state.temp3_c
    fill_in "Temp4 c", with: @device_state.temp4_c
    fill_in "Temp5 c", with: @device_state.temp5_c
    fill_in "Temp6 c", with: @device_state.temp6_c
    fill_in "Temp7 c", with: @device_state.temp7_c
    fill_in "Temp8 c", with: @device_state.temp8_c
    check "Terrainactive" if @device_state.terrainactive
    fill_in "Text1", with: @device_state.text1
    fill_in "Text2", with: @device_state.text2
    fill_in "Text3", with: @device_state.text3
    fill_in "Text4", with: @device_state.text4
    fill_in "Text5", with: @device_state.text5
    fill_in "Text6", with: @device_state.text6
    fill_in "Text7", with: @device_state.text7
    fill_in "Text8", with: @device_state.text8
    fill_in "Throttle angle", with: @device_state.throttle_angle
    fill_in "Timeinair", with: @device_state.timeInAir
    fill_in "Turn signal", with: @device_state.turn_signal
    fill_in "Version", with: @device_state.version
    fill_in "Vibex", with: @device_state.vibex
    fill_in "Vibey", with: @device_state.vibey
    fill_in "Vibez", with: @device_state.vibez
    fill_in "Voltage sensor1 mv", with: @device_state.voltage_sensor1_mv
    fill_in "Voltage sensor2 mv", with: @device_state.voltage_sensor2_mv
    fill_in "Voltage sensor3 mv", with: @device_state.voltage_sensor3_mv
    fill_in "Voltage sensor4 mv", with: @device_state.voltage_sensor4_mv
    fill_in "Voltage sensor5 mv", with: @device_state.voltage_sensor5_mv
    fill_in "Voltage sensor6 mv", with: @device_state.voltage_sensor6_mv
    fill_in "Voltage sensor7 mv", with: @device_state.voltage_sensor7_mv
    fill_in "Voltage sensor9 mv", with: @device_state.voltage_sensor9_mv
    fill_in "Vx", with: @device_state.vx
    fill_in "Vy", with: @device_state.vy
    fill_in "Vz", with: @device_state.vz
    fill_in "Wifi band", with: @device_state.wifi_band
    fill_in "Wifi bssid", with: @device_state.wifi_bssid
    fill_in "Wifi bytes received", with: @device_state.wifi_bytes_received
    fill_in "Wifi bytes sent", with: @device_state.wifi_bytes_sent
    fill_in "Wifi channel", with: @device_state.wifi_channel
    fill_in "Wifi connection status", with: @device_state.wifi_connection_status
    fill_in "Wifi ip address", with: @device_state.wifi_ip_address
    fill_in "Wifi link speed mbps", with: @device_state.wifi_link_speed_mbps
    fill_in "Wifi rssi dbm", with: @device_state.wifi_rssi_dbm
    fill_in "Wifi snr db", with: @device_state.wifi_snr_db
    fill_in "Wifi ssid", with: @device_state.wifi_ssid
    fill_in "Wifi uptime sec", with: @device_state.wifi_uptime_sec
    check "Xpdr adsb tx sys fail" if @device_state.xpdr_adsb_tx_sys_fail
    check "Xpdr airborne status" if @device_state.xpdr_airborne_status
    fill_in "Xpdr board temperature c", with: @device_state.xpdr_board_temperature_c
    check "Xpdr es1090 tx enable" if @device_state.xpdr_es1090_tx_enable
    fill_in "Xpdr flight", with: @device_state.xpdr_flight_id
    check "Xpdr gps no fix" if @device_state.xpdr_gps_no_fix
    check "Xpdr gps unavail" if @device_state.xpdr_gps_unavail
    check "Xpdr ident active" if @device_state.xpdr_ident_active
    check "Xpdr interrogated since" if @device_state.xpdr_interrogated_since
    check "Xpdr maint req" if @device_state.xpdr_maint_req
    check "Xpdr mode a enable" if @device_state.xpdr_mode_A_enable
    fill_in "Xpdr mode a squawk", with: @device_state.xpdr_mode_A_squawk
    check "Xpdr mode c enable" if @device_state.xpdr_mode_C_enable
    check "Xpdr mode s enable" if @device_state.xpdr_mode_S_enable
    fill_in "Xpdr nacp", with: @device_state.xpdr_nacp
    fill_in "Xpdr nic", with: @device_state.xpdr_nic
    check "Xpdr status pending" if @device_state.xpdr_status_pending
    check "Xpdr status unavail" if @device_state.xpdr_status_unavail
    check "Xpdr x bit status" if @device_state.xpdr_x_bit_status
    fill_in "Yaw deg", with: @device_state.yaw_deg
    click_on "Create Device state"

    assert_text "Device state was successfully created"
    click_on "Back"
  end

  test "should update Device state" do
    visit device_state_url(@device_state)
    click_on "Edit this device state", match: :first

    fill_in "Device", with: @device_state.Device_id
    fill_in "Airspeed", with: @device_state.airspeed
    fill_in "Analog output1", with: @device_state.analog_output1
    fill_in "Analog output2", with: @device_state.analog_output2
    fill_in "Analog output3", with: @device_state.analog_output3
    fill_in "Analog output4", with: @device_state.analog_output4
    fill_in "Analog output5", with: @device_state.analog_output5
    fill_in "Analog output6", with: @device_state.analog_output6
    fill_in "Analog output7", with: @device_state.analog_output7
    fill_in "Analog output8", with: @device_state.analog_output8
    check "Armed" if @device_state.armed
    fill_in "Ax1", with: @device_state.ax1
    fill_in "Ax2", with: @device_state.ax2
    fill_in "Ax3", with: @device_state.ax3
    fill_in "Ay1", with: @device_state.ay1
    fill_in "Ay2", with: @device_state.ay2
    fill_in "Ay3", with: @device_state.ay3
    fill_in "Az1", with: @device_state.az1
    fill_in "Az2", with: @device_state.az2
    fill_in "Az3", with: @device_state.az3
    fill_in "Battery1 a", with: @device_state.battery1_a
    fill_in "Battery1 percent", with: @device_state.battery1_percent
    fill_in "Battery1 temp c", with: @device_state.battery1_temp_c
    fill_in "Battery1 v", with: @device_state.battery1_v
    fill_in "Battery2 a", with: @device_state.battery2_a
    fill_in "Battery2 percent", with: @device_state.battery2_percent
    fill_in "Battery2 temp c", with: @device_state.battery2_temp_c
    fill_in "Battery2 v", with: @device_state.battery2_v
    fill_in "Battery3 a", with: @device_state.battery3_a
    fill_in "Battery3 percent", with: @device_state.battery3_percent
    fill_in "Battery3 temp c", with: @device_state.battery3_temp_c
    fill_in "Battery3 v", with: @device_state.battery3_v
    fill_in "Battery4 a", with: @device_state.battery4_a
    fill_in "Battery4 percent", with: @device_state.battery4_percent
    fill_in "Battery4 temp c", with: @device_state.battery4_temp_c
    fill_in "Battery4 v", with: @device_state.battery4_v
    fill_in "Battery5 a", with: @device_state.battery5_a
    fill_in "Battery5 percent", with: @device_state.battery5_percent
    fill_in "Battery5 temp c", with: @device_state.battery5_temp_c
    fill_in "Battery5 v", with: @device_state.battery5_v
    fill_in "Battery6 a", with: @device_state.battery6_a
    fill_in "Battery6 percent", with: @device_state.battery6_percent
    fill_in "Battery6 temp c", with: @device_state.battery6_temp_c
    fill_in "Battery6 v", with: @device_state.battery6_v
    fill_in "Battery7 a", with: @device_state.battery7_a
    fill_in "Battery7 percent", with: @device_state.battery7_percent
    fill_in "Battery7 temp c", with: @device_state.battery7_temp_c
    fill_in "Battery7 v", with: @device_state.battery7_v
    fill_in "Battery8 a", with: @device_state.battery8_a
    fill_in "Battery8 percent", with: @device_state.battery8_percent
    fill_in "Battery8 temp c", with: @device_state.battery8_temp_c
    fill_in "Battery8 v", with: @device_state.battery8_v
    fill_in "Brake angle", with: @device_state.brake_angle
    check "Button1" if @device_state.button1
    check "Button2" if @device_state.button2
    fill_in "Cell connection state", with: @device_state.cell_connection_state
    fill_in "Cell", with: @device_state.cell_id
    fill_in "Cell ip", with: @device_state.cell_ip
    fill_in "Cell latency ms", with: @device_state.cell_latency_ms
    fill_in "Cell network bps down", with: @device_state.cell_network_bps_down
    fill_in "Cell network bps up", with: @device_state.cell_network_bps_up
    fill_in "Cell network bytes recevied", with: @device_state.cell_network_bytes_recevied
    fill_in "Cell network bytes sent", with: @device_state.cell_network_bytes_sent
    fill_in "Cell network registration state", with: @device_state.cell_network_registration_state
    fill_in "Cell network type", with: @device_state.cell_network_type
    fill_in "Cell retry count", with: @device_state.cell_retry_count
    fill_in "Cell rsrp", with: @device_state.cell_rsrp
    fill_in "Cell rsrq", with: @device_state.cell_rsrq
    fill_in "Cell rssi dbm", with: @device_state.cell_rssi_dbm
    fill_in "Cell sinr", with: @device_state.cell_sinr
    fill_in "Charge a", with: @device_state.charge_a
    fill_in "Charge v", with: @device_state.charge_v
    fill_in "Color b", with: @device_state.color_b
    fill_in "Color g", with: @device_state.color_g
    fill_in "Color r", with: @device_state.color_r
    fill_in "Current sensor1 ma", with: @device_state.current_sensor1_ma
    fill_in "Current sensor2 ma", with: @device_state.current_sensor2_ma
    fill_in "Current sensor3 ma", with: @device_state.current_sensor3_ma
    fill_in "Current sensor4 ma", with: @device_state.current_sensor4_ma
    fill_in "Current sensor5 ma", with: @device_state.current_sensor5_ma
    fill_in "Current sensor6 ma", with: @device_state.current_sensor6_ma
    fill_in "Current sensor7 ma", with: @device_state.current_sensor7_ma
    fill_in "Current sensor8 ma", with: @device_state.current_sensor8_ma
    fill_in "Default gateway", with: @device_state.default_gateway
    fill_in "Dhcp lease", with: @device_state.dhcp_lease
    fill_in "Dhcp status", with: @device_state.dhcp_status
    check "Digital input1" if @device_state.digital_input1
    check "Digital input2" if @device_state.digital_input2
    check "Digital input3" if @device_state.digital_input3
    check "Digital input4" if @device_state.digital_input4
    check "Digital input5" if @device_state.digital_input5
    check "Digital input6" if @device_state.digital_input6
    check "Digital input7" if @device_state.digital_input7
    check "Digital input8" if @device_state.digital_input8
    check "Digital output1" if @device_state.digital_output1
    check "Digital output2" if @device_state.digital_output2
    check "Digital output3" if @device_state.digital_output3
    check "Digital output4" if @device_state.digital_output4
    check "Digital output5" if @device_state.digital_output5
    check "Digital output6" if @device_state.digital_output6
    check "Digital output7" if @device_state.digital_output7
    check "Digital output8" if @device_state.digital_output8
    fill_in "Efi baro", with: @device_state.efi_baro
    fill_in "Efi exhaust temp c", with: @device_state.efi_exhaust_temp_c
    fill_in "Efi fuel flow lps", with: @device_state.efi_fuel_flow_lps
    fill_in "Efi fuel percent", with: @device_state.efi_fuel_percent
    fill_in "Efi fuel pressure bar", with: @device_state.efi_fuel_pressure_bar
    fill_in "Efi intake temp c", with: @device_state.efi_intake_temp_c
    fill_in "Efi load", with: @device_state.efi_load
    fill_in "Efi rpm", with: @device_state.efi_rpm
    fill_in "Esc10 a", with: @device_state.esc10_a
    fill_in "Esc10 rpm", with: @device_state.esc10_rpm
    fill_in "Esc10 temp c", with: @device_state.esc10_temp_c
    fill_in "Esc10 v", with: @device_state.esc10_v
    fill_in "Esc11 a", with: @device_state.esc11_a
    fill_in "Esc11 rpm", with: @device_state.esc11_rpm
    fill_in "Esc11 temp c", with: @device_state.esc11_temp_c
    fill_in "Esc11 v", with: @device_state.esc11_v
    fill_in "Esc12 a", with: @device_state.esc12_a
    fill_in "Esc12 rpm", with: @device_state.esc12_rpm
    fill_in "Esc12 temp c", with: @device_state.esc12_temp_c
    fill_in "Esc12 v", with: @device_state.esc12_v
    fill_in "Esc13 a", with: @device_state.esc13_a
    fill_in "Esc13 rpm", with: @device_state.esc13_rpm
    fill_in "Esc13 temp c", with: @device_state.esc13_temp_c
    fill_in "Esc13 v", with: @device_state.esc13_v
    fill_in "Esc14 a", with: @device_state.esc14_a
    fill_in "Esc14 rpm", with: @device_state.esc14_rpm
    fill_in "Esc14 temp c", with: @device_state.esc14_temp_c
    fill_in "Esc14 v", with: @device_state.esc14_v
    fill_in "Esc15 a", with: @device_state.esc15_a
    fill_in "Esc15 rpm", with: @device_state.esc15_rpm
    fill_in "Esc15 temp c", with: @device_state.esc15_temp_c
    fill_in "Esc15 v", with: @device_state.esc15_v
    fill_in "Esc16 a", with: @device_state.esc16_a
    fill_in "Esc16 rpm", with: @device_state.esc16_rpm
    fill_in "Esc16 temp c", with: @device_state.esc16_temp_c
    fill_in "Esc16 v", with: @device_state.esc16_v
    fill_in "Esc1 a", with: @device_state.esc1_a
    fill_in "Esc1 rpm", with: @device_state.esc1_rpm
    fill_in "Esc1 temp c", with: @device_state.esc1_temp_c
    fill_in "Esc1 v", with: @device_state.esc1_v
    fill_in "Esc2 a", with: @device_state.esc2_a
    fill_in "Esc2 rpm", with: @device_state.esc2_rpm
    fill_in "Esc2 temp c", with: @device_state.esc2_temp_c
    fill_in "Esc2 v", with: @device_state.esc2_v
    fill_in "Esc3 a", with: @device_state.esc3_a
    fill_in "Esc3 rpm", with: @device_state.esc3_rpm
    fill_in "Esc3 temp c", with: @device_state.esc3_temp_c
    fill_in "Esc3 v", with: @device_state.esc3_v
    fill_in "Esc4 a", with: @device_state.esc4_a
    fill_in "Esc4 rpm", with: @device_state.esc4_rpm
    fill_in "Esc4 temp c", with: @device_state.esc4_temp_c
    fill_in "Esc4 v", with: @device_state.esc4_v
    fill_in "Esc5 a", with: @device_state.esc5_a
    fill_in "Esc5 rpm", with: @device_state.esc5_rpm
    fill_in "Esc5 temp c", with: @device_state.esc5_temp_c
    fill_in "Esc5 v", with: @device_state.esc5_v
    fill_in "Esc6 a", with: @device_state.esc6_a
    fill_in "Esc6 rpm", with: @device_state.esc6_rpm
    fill_in "Esc6 temp c", with: @device_state.esc6_temp_c
    fill_in "Esc6 v", with: @device_state.esc6_v
    fill_in "Esc7 a", with: @device_state.esc7_a
    fill_in "Esc7 rpm", with: @device_state.esc7_rpm
    fill_in "Esc7 temp c", with: @device_state.esc7_temp_c
    fill_in "Esc7 v", with: @device_state.esc7_v
    fill_in "Esc8 a", with: @device_state.esc8_a
    fill_in "Esc8 rpm", with: @device_state.esc8_rpm
    fill_in "Esc8 temp c", with: @device_state.esc8_temp_c
    fill_in "Esc8 v", with: @device_state.esc8_v
    fill_in "Esc9 a", with: @device_state.esc9_a
    fill_in "Esc9 rpm", with: @device_state.esc9_rpm
    fill_in "Esc9 temp c", with: @device_state.esc9_temp_c
    fill_in "Esc9 v", with: @device_state.esc9_v
    fill_in "Ethernet link status", with: @device_state.ethernet_link_status
    fill_in "Ethernet speed", with: @device_state.ethernet_speed
    check "Extend1" if @device_state.extend1
    check "Extend2" if @device_state.extend2
    check "Extended1" if @device_state.extended1
    check "Extended2" if @device_state.extended2
    check "Failsafe" if @device_state.failsafe
    fill_in "Fan1 a", with: @device_state.fan1_a
    fill_in "Fan1 rpm", with: @device_state.fan1_rpm
    fill_in "Fan1 v", with: @device_state.fan1_v
    fill_in "Fan2 a", with: @device_state.fan2_a
    fill_in "Fan2 rpm", with: @device_state.fan2_rpm
    fill_in "Fan2 v", with: @device_state.fan2_v
    fill_in "Geiger mrad", with: @device_state.geiger_mrad
    fill_in "Gimbal heading deg", with: @device_state.gimbal_heading_deg
    fill_in "Gimbal target heading deg", with: @device_state.gimbal_target_heading_deg
    fill_in "Gimbal target tilt deg", with: @device_state.gimbal_target_tilt_deg
    fill_in "Gimbal target yaw deg", with: @device_state.gimbal_target_yaw_deg
    fill_in "Gimbal tilt deg", with: @device_state.gimbal_tilt_deg
    fill_in "Gimbal yaw deg", with: @device_state.gimbal_yaw_deg
    fill_in "Gps1 altitude", with: @device_state.gps1_altitude
    fill_in "Gps1 fix type", with: @device_state.gps1_fix_type
    fill_in "Gps1 hdop", with: @device_state.gps1_hdop
    fill_in "Gps1 heading", with: @device_state.gps1_heading
    fill_in "Gps1 speed", with: @device_state.gps1_speed
    fill_in "Gps1 status", with: @device_state.gps1_status
    fill_in "Gps1 timestamp", with: @device_state.gps1_timestamp
    fill_in "Gps2 altitude", with: @device_state.gps2_altitude
    fill_in "Gps2 fix type", with: @device_state.gps2_fix_type
    fill_in "Gps2 hdop", with: @device_state.gps2_hdop
    fill_in "Gps2 heading", with: @device_state.gps2_heading
    fill_in "Gps2 speed", with: @device_state.gps2_speed
    fill_in "Gps2 status", with: @device_state.gps2_status
    fill_in "Gps2 timestamp", with: @device_state.gps2_timestamp
    fill_in "Hall1 angle degrees", with: @device_state.hall1_angle_degrees
    check "Hall1 presence" if @device_state.hall1_presence
    fill_in "Hall2 angle degrees", with: @device_state.hall2_angle_degrees
    check "Hall2 presence" if @device_state.hall2_presence
    fill_in "Hall3 angle degrees", with: @device_state.hall3_angle_degrees
    check "Hall3 presence" if @device_state.hall3_presence
    fill_in "Hall4 angle degrees", with: @device_state.hall4_angle_degrees
    check "Hall4 presence" if @device_state.hall4_presence
    fill_in "Hall5 angle degrees", with: @device_state.hall5_angle_degrees
    check "Hall5 presence" if @device_state.hall5_presence
    fill_in "Hall6 angle degrees", with: @device_state.hall6_angle_degrees
    check "Hall6 presence" if @device_state.hall6_presence
    fill_in "Hall7 angle degrees", with: @device_state.hall7_angle_degrees
    check "Hall7 presence" if @device_state.hall7_presence
    fill_in "Hall8 angle degrees", with: @device_state.hall8_angle_degrees
    check "Hall8 presence" if @device_state.hall8_presence
    fill_in "Ham radio a", with: @device_state.ham_radio_a
    check "Ham radio enable" if @device_state.ham_radio_enable
    fill_in "Ham radio rx hz", with: @device_state.ham_radio_rx_hz
    fill_in "Ham radio tx hz", with: @device_state.ham_radio_tx_hz
    fill_in "Ham radio v", with: @device_state.ham_radio_v
    fill_in "Ham radio watts", with: @device_state.ham_radio_watts
    fill_in "Heading deg", with: @device_state.heading_deg
    check "Headlight" if @device_state.headlight
    fill_in "Heater1 a", with: @device_state.heater1_a
    fill_in "Heater1 temp c", with: @device_state.heater1_temp_c
    fill_in "Heater1 v", with: @device_state.heater1_v
    fill_in "Heater2 a", with: @device_state.heater2_a
    fill_in "Heater2 temp c", with: @device_state.heater2_temp_c
    fill_in "Heater2 v", with: @device_state.heater2_v
    fill_in "Heater3 a", with: @device_state.heater3_a
    fill_in "Heater3 temp c", with: @device_state.heater3_temp_c
    fill_in "Heater3 v", with: @device_state.heater3_v
    fill_in "Heater4 a", with: @device_state.heater4_a
    fill_in "Heater4 temp c", with: @device_state.heater4_temp_c
    fill_in "Heater4 v", with: @device_state.heater4_v
    fill_in "Humidity1", with: @device_state.humidity1
    fill_in "Humidity2", with: @device_state.humidity2
    fill_in "Imu1 temp c", with: @device_state.imu1_temp_c
    fill_in "Imu2 temp c", with: @device_state.imu2_temp_c
    fill_in "Imu3 temp c", with: @device_state.imu3_temp_c
    fill_in "Ip address", with: @device_state.ip_address
    check "Landed" if @device_state.landed
    fill_in "Landed state", with: @device_state.landed_state
    check "Laser" if @device_state.laser
    fill_in "Latitude1", with: @device_state.latitude1
    fill_in "Latitude2", with: @device_state.latitude2
    fill_in "Load cell1 n", with: @device_state.load_cell1_n
    fill_in "Load cell2 n", with: @device_state.load_cell2_n
    fill_in "Load cell3 n", with: @device_state.load_cell3_n
    fill_in "Load cell4 n", with: @device_state.load_cell4_n
    fill_in "Longitude1", with: @device_state.longitude1
    fill_in "Longitude2", with: @device_state.longitude2
    fill_in "Mac address", with: @device_state.mac_address
    fill_in "Mag1", with: @device_state.mag1
    fill_in "Mag2", with: @device_state.mag2
    fill_in "Mag3", with: @device_state.mag3
    fill_in "Mag4", with: @device_state.mag4
    check "Maglock" if @device_state.maglock
    fill_in "Magnetic x", with: @device_state.magnetic_x
    fill_in "Magnetic y", with: @device_state.magnetic_y
    fill_in "Magnetic z", with: @device_state.magnetic_z
    fill_in "Mode", with: @device_state.mode
    fill_in "Nav bearing", with: @device_state.nav_bearing
    fill_in "Nav pitch", with: @device_state.nav_pitch
    fill_in "Nav roll", with: @device_state.nav_roll
    check "Prearmed" if @device_state.prearmed
    fill_in "Pressure pa", with: @device_state.pressure_pa
    fill_in "Rangefinder1 m", with: @device_state.rangefinder1_m
    fill_in "Rangefinder2 m", with: @device_state.rangefinder2_m
    fill_in "Rangefinder3 m", with: @device_state.rangefinder3_m
    fill_in "Rangefinder4 m", with: @device_state.rangefinder4_m
    fill_in "Rangefinder5 m", with: @device_state.rangefinder5_m
    fill_in "Rangefinder6 m", with: @device_state.rangefinder6_m
    fill_in "Rangefinder7 m", with: @device_state.rangefinder7_m
    fill_in "Rangefinder8 m", with: @device_state.rangefinder8_m
    fill_in "Roll deg", with: @device_state.roll_deg
    check "Safetyactive" if @device_state.safetyactive
    fill_in "Satcount1", with: @device_state.satcount1
    fill_in "Satcount2", with: @device_state.satcount2
    fill_in "Solar1 a", with: @device_state.solar1_a
    fill_in "Solar1 v", with: @device_state.solar1_v
    fill_in "Solar2 a", with: @device_state.solar2_a
    fill_in "Solar2 v", with: @device_state.solar2_v
    fill_in "Sonar range m", with: @device_state.sonar_range_m
    fill_in "Sonar v", with: @device_state.sonar_v
    check "Spotlight" if @device_state.spotlight
    fill_in "Status", with: @device_state.status
    fill_in "Steering wheel angle", with: @device_state.steering_wheel_angle
    fill_in "Subnet mask", with: @device_state.subnet_mask
    check "Switch1" if @device_state.switch1
    check "Switch2" if @device_state.switch2
    fill_in "Temp1 c", with: @device_state.temp1_c
    fill_in "Temp2 c", with: @device_state.temp2_c
    fill_in "Temp3 c", with: @device_state.temp3_c
    fill_in "Temp4 c", with: @device_state.temp4_c
    fill_in "Temp5 c", with: @device_state.temp5_c
    fill_in "Temp6 c", with: @device_state.temp6_c
    fill_in "Temp7 c", with: @device_state.temp7_c
    fill_in "Temp8 c", with: @device_state.temp8_c
    check "Terrainactive" if @device_state.terrainactive
    fill_in "Text1", with: @device_state.text1
    fill_in "Text2", with: @device_state.text2
    fill_in "Text3", with: @device_state.text3
    fill_in "Text4", with: @device_state.text4
    fill_in "Text5", with: @device_state.text5
    fill_in "Text6", with: @device_state.text6
    fill_in "Text7", with: @device_state.text7
    fill_in "Text8", with: @device_state.text8
    fill_in "Throttle angle", with: @device_state.throttle_angle
    fill_in "Timeinair", with: @device_state.timeInAir
    fill_in "Turn signal", with: @device_state.turn_signal
    fill_in "Version", with: @device_state.version
    fill_in "Vibex", with: @device_state.vibex
    fill_in "Vibey", with: @device_state.vibey
    fill_in "Vibez", with: @device_state.vibez
    fill_in "Voltage sensor1 mv", with: @device_state.voltage_sensor1_mv
    fill_in "Voltage sensor2 mv", with: @device_state.voltage_sensor2_mv
    fill_in "Voltage sensor3 mv", with: @device_state.voltage_sensor3_mv
    fill_in "Voltage sensor4 mv", with: @device_state.voltage_sensor4_mv
    fill_in "Voltage sensor5 mv", with: @device_state.voltage_sensor5_mv
    fill_in "Voltage sensor6 mv", with: @device_state.voltage_sensor6_mv
    fill_in "Voltage sensor7 mv", with: @device_state.voltage_sensor7_mv
    fill_in "Voltage sensor9 mv", with: @device_state.voltage_sensor9_mv
    fill_in "Vx", with: @device_state.vx
    fill_in "Vy", with: @device_state.vy
    fill_in "Vz", with: @device_state.vz
    fill_in "Wifi band", with: @device_state.wifi_band
    fill_in "Wifi bssid", with: @device_state.wifi_bssid
    fill_in "Wifi bytes received", with: @device_state.wifi_bytes_received
    fill_in "Wifi bytes sent", with: @device_state.wifi_bytes_sent
    fill_in "Wifi channel", with: @device_state.wifi_channel
    fill_in "Wifi connection status", with: @device_state.wifi_connection_status
    fill_in "Wifi ip address", with: @device_state.wifi_ip_address
    fill_in "Wifi link speed mbps", with: @device_state.wifi_link_speed_mbps
    fill_in "Wifi rssi dbm", with: @device_state.wifi_rssi_dbm
    fill_in "Wifi snr db", with: @device_state.wifi_snr_db
    fill_in "Wifi ssid", with: @device_state.wifi_ssid
    fill_in "Wifi uptime sec", with: @device_state.wifi_uptime_sec
    check "Xpdr adsb tx sys fail" if @device_state.xpdr_adsb_tx_sys_fail
    check "Xpdr airborne status" if @device_state.xpdr_airborne_status
    fill_in "Xpdr board temperature c", with: @device_state.xpdr_board_temperature_c
    check "Xpdr es1090 tx enable" if @device_state.xpdr_es1090_tx_enable
    fill_in "Xpdr flight", with: @device_state.xpdr_flight_id
    check "Xpdr gps no fix" if @device_state.xpdr_gps_no_fix
    check "Xpdr gps unavail" if @device_state.xpdr_gps_unavail
    check "Xpdr ident active" if @device_state.xpdr_ident_active
    check "Xpdr interrogated since" if @device_state.xpdr_interrogated_since
    check "Xpdr maint req" if @device_state.xpdr_maint_req
    check "Xpdr mode a enable" if @device_state.xpdr_mode_A_enable
    fill_in "Xpdr mode a squawk", with: @device_state.xpdr_mode_A_squawk
    check "Xpdr mode c enable" if @device_state.xpdr_mode_C_enable
    check "Xpdr mode s enable" if @device_state.xpdr_mode_S_enable
    fill_in "Xpdr nacp", with: @device_state.xpdr_nacp
    fill_in "Xpdr nic", with: @device_state.xpdr_nic
    check "Xpdr status pending" if @device_state.xpdr_status_pending
    check "Xpdr status unavail" if @device_state.xpdr_status_unavail
    check "Xpdr x bit status" if @device_state.xpdr_x_bit_status
    fill_in "Yaw deg", with: @device_state.yaw_deg
    click_on "Update Device state"

    assert_text "Device state was successfully updated"
    click_on "Back"
  end

  test "should destroy Device state" do
    visit device_state_url(@device_state)
    click_on "Destroy this device state", match: :first

    assert_text "Device state was successfully destroyed"
  end
end
