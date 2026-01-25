class DeviceStatesController < ApplicationController
  before_action :set_device_state, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /device_states or /device_states.json
  def index
    @device_states = DeviceState.all
  end

  # GET /device_states/1 or /device_states/1.json
  def show
  end

  # GET /device_states/new
  def new
    @device_state = DeviceState.new
  end

  # GET /device_states/1/edit
  def edit
  end

  # POST /device_states or /device_states.json
  def create
    @device_state = DeviceState.new(device_state_params)
    #debugger
    filtered_params = device_state_params
    logger.debug filtered_params.inspect
    par = filtered_params[:Device_id]
    logger.debug "par: #{par}"
    device = Device.find(par)
    device.state = @device_state
    device.save

    respond_to do |format|
      if @device_state.save
        format.html { redirect_to @device_state, notice: "Device state was successfully created." }
        format.json { render :show, status: :created, location: @device_state }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @device_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /device_states/1 or /device_states/1.json
  def update
    respond_to do |format|
      if @device_state.update(device_state_params)
        format.html { redirect_to @device_state, notice: "Device state was successfully updated." }
        format.json { render :show, status: :ok, location: @device_state }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @device_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_states/1 or /device_states/1.json
  def destroy
    @device_state.destroy!

    respond_to do |format|
      format.html { redirect_to device_states_path, status: :see_other, notice: "Device state was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_state
      @device_state = DeviceState.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def device_state_params
      params.expect(device_state:[:Device_id, :version, :armed, :prearmed, :mode, :status, :latitude1, :longitude1, :gps1_status, :latitude2, :longitude2, :gps2_status, :satcount, :rssi, :rxrssi, :rxerrors, :vibex, :vibey, :vibez, :heading_deg, :roll_deg, :yaw_deg, :landed, :landed_state, :timeInAir, :extended1, :extend1, :extended2, :extend2, :maglock, :laser, :headlight, :spotlight, :ax1, :ay1, :az1, :ax2, :ay2, :az2, :ax3, :ay3, :az3, :vx, :vy, :vz, :imu1_temp_c, :imu2_temp_c, :imu3_temp_c, :gimbal_heading_deg, :gimbal_tilt_deg, :gimbal_yaw_deg, :gimbal_target_heading_deg, :gimbal_target_tilt_deg, :gimbal_target_yaw_deg, :nav_bearing, :nav_pitch, :nav_roll, :magnetic_x, :magnetic_y, :magnetic_z, :sonar_range_m, :sonar_v, :terrainactive, :safetyactive, :failsafe, :temp1_c, :temp2_c, :temp3_c, :temp4_c, :temp5_c, :temp6_c, :temp7_c, :temp8_c, :pressure_pa, :airspeed, :battery1_v, :battery1_a, :battery1_temp_c, :battery1_percent, :battery2_v, :battery2_a, :battery2_temp_c, :battery2_percent, :battery3_v, :battery3_a, :battery3_temp_c, :battery3_percent, :battery4_v, :battery4_a, :battery4_temp_c, :battery4_percent, :battery5_v, :battery5_a, :battery5_temp_c, :battery5_percent, :battery6_v, :battery6_a, :battery6_temp_c, :battery6_percent, :battery7_v, :battery7_a, :battery7_temp_c, :battery7_percent, :battery8_v, :battery8_a, :battery8_temp_c, :battery8_percent, :esc1_v, :esc1_a, :esc1_temp_c, :esc1_rpm, :esc2_v, :esc2_a, :esc2_temp_c, :esc2_rpm, :esc3_v, :esc3_a, :esc3_temp_c, :esc3_rpm, :esc4_v, :esc4_a, :esc4_temp_c, :esc4_rpm, :esc5_v, :esc5_a, :esc5_temp_c, :esc5_rpm, :esc6_v, :esc6_a, :esc6_temp_c, :esc6_rpm, :esc7_v, :esc7_a, :esc7_temp_c, :esc7_rpm, :esc8_v, :esc8_a, :esc8_temp_c, :esc8_rpm, :esc9_v, :esc9_a, :esc9_temp_c, :esc9_rpm, :esc10_v, :esc10_a, :esc10_temp_c, :esc10_rpm, :esc11_v, :esc11_a, :esc11_temp_c, :esc11_rpm, :esc12_v, :esc12_a, :esc12_temp_c, :esc12_rpm, :esc13_v, :esc13_a, :esc13_temp_c, :esc13_rpm, :esc14_v, :esc14_a, :esc14_temp_c, :esc14_rpm, :esc15_v, :esc15_a, :esc15_temp_c, :esc15_rpm, :esc16_v, :esc16_a, :esc16_temp_c, :esc16_rpm, :efi_rpm, :efi_fuel_pressure_bar, :efi_intake_temp_c, :efi_exhaust_temp_c, :efi_fuel_flow_lps, :efi_fuel_percent, :efi_baro, :efi_load, :throttle_angle, :brake_angle, :steering_wheel_angle, :turn_signal, :xpdr_adsb_tx_sys_fail, :xpdr_airborne_status, :xpdr_board_temperature_c, :xpdr_es1090_tx_enable, :xpdr_flight_id, :xpdr_gps_no_fix, :xpdr_gps_unavail, :xpdr_ident_active, :xpdr_interrogated_since, :xpdr_maint_req, :xpdr_mode_A_enable, :xpdr_mode_A_squawk, :xpdr_mode_C_enable, :xpdr_mode_S_enable, :xpdr_nacp, :xpdr_nic, :xpdr_status_pending, :xpdr_status_unavail, :xpdr_x_bit_status, :heater1_v, :heater1_a, :heater1_temp_c, :heater2_v, :heater2_a, :heater2_temp_c, :heater3_v, :heater3_a, :heater3_temp_c, :heater4_v, :heater4_a, :heater4_temp_c, :humidity1, :humidity2, :fan1_v, :fan1_a, :fan1_rpm, :fan2_v, :fan2_a, :fan2_rpm, :rangefinder1_m, :rangefinder2_m, :rangefinder3_m, :rangefinder4_m, :rangefinder5_m, :rangefinder6_m, :rangefinder7_m, :rangefinder8_m, :solar1_v, :solar1_a, :solar2_v, :solar2_a, :charge_v, :charge_a, :mag1, :mag2, :mag3, :mag4, :button1, :button2, :switch1, :switch2, :load_cell1_n, :load_cell2_n, :load_cell3_n, :load_cell4_n, :current_sensor1_ma, :current_sensor2_ma, :current_sensor3_ma, :current_sensor4_ma, :current_sensor5_ma, :current_sensor6_ma, :current_sensor7_ma, :current_sensor8_ma, :voltage_sensor1_mv, :voltage_sensor2_mv, :voltage_sensor3_mv, :voltage_sensor4_mv, :voltage_sensor5_mv, :voltage_sensor6_mv, :voltage_sensor7_mv, :voltage_sensor8_mv, :digital_output1, :digital_output2, :digital_output3, :digital_output4, :digital_output5, :digital_output6, :digital_output7, :digital_output8, :digital_input1, :digital_input2, :digital_input3, :digital_input4, :digital_input5, :digital_input6, :digital_input7, :digital_input8, :analog_output1, :analog_output2, :analog_output3, :analog_output4, :analog_output5, :analog_output6, :analog_output7, :analog_output8, :hall1_angle_degrees, :hall2_angle_degrees, :hall3_angle_degrees, :hall4_angle_degrees, :hall5_angle_degrees, :hall6_angle_degrees, :hall7_angle_degrees, :hall8_angle_degrees, :hall1_presence, :hall2_presence, :hall3_presence, :hall4_presence, :hall5_presence, :hall6_presence, :hall7_presence, :hall8_presence, :lidar1, :lidar2, :lidar3, :lidar4, :lidar5, :lidar6, :lidar7, :lidar8, :radar1, :radar2, :radar3, :radar4, :radar5, :radar6, :radar7, :radar8, :ham_radio_rx_hz, :ham_radio_tx_hz, :ham_radio_watts, :ham_radio_enable, :ham_radio_v, :ham_radio_a, :geiger_mrad, :color_r, :color_g, :color_b, :text1, :text2, :text3, :text4, :text5, :text6, :text7, :text8, :ip_address, :mac_address, :link_status, :subnet_mask, :default_gateway, :dhcp_enabled, :dhcp_lease, :wifi_ssid, :wifi_bssid, :wifi_rssi_dbm, :wifi_snr_db, :wifi_link_speed_mbps, :wifi_band, :wifi_channel, :wifi_ip_address, :wifi_connection_status, :wifi_uptime_sec, :wifi_bytes_sent, :wifi_bytes_received ])
    end
end
