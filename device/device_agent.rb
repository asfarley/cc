require 'net/http'
require 'uri'
require 'json'
require 'socket'
require 'pry'

class DeviceAgent

	def run_agent
		loop do
			puts "Authenticating..."
			token_info = get_auth_token()
			puts "Constructing device state..."
			device_state = get_device_state()
			puts "Sending device state..."
			post_device_state(device_state, token_info)
			puts "Getting commands..."
			commands = get_commands(token_info)
			puts "Executing commands..."
			execute(commands)
			puts "Sleeping."
			sleep(10)
		end
	end

	def get_auth_token
		uri_auth = URI('http://0.0.0.0:3000')
		hostname_auth = uri_auth.hostname # => "example.com"
		uri_auth.path = '/api/auth/sign_in'
		auth_req = Net::HTTP::Post.new(uri_auth) # => #<Net::HTTP::Post POST>
		credentials = {
		  email: ENV["ADMIN_EMAIL"],
		  password: ENV["ADMIN_PASSWORD"]
		}
		auth_req.body = credentials.to_json
		auth_req.content_type = 'application/json'
		auth_res = Net::HTTP.start(hostname_auth, uri_auth.port) do |http1|
		  http1.request(auth_req)
		end

		# Print the response
		puts "Status: #{auth_res.code}"
		puts "Body: #{auth_res.body}"

		token_info = {
		    'access-token' => "",
		    'client'       => "",
		    'uid'          => ""
		  }

		# Parse and extract tokens from headers
		if auth_res.code.to_i == 200
		  headers = auth_res.to_hash
		  token_info = {
		    'access-token' => headers['access-token']&.first,
		    'client'       => headers['client']&.first,
		    'uid'          => headers['uid']&.first
		  }
		  puts "Auth Tokens: #{token_info}"
		  return token_info
		end
		
		return nil
	end

	def post_device_state(device_state, token_info)
		uri_state = URI('http://0.0.0.0:3000')
		hostname_state = uri_state.hostname # => "example.com"
		uri_state.path = '/device_states.json'
		req = Net::HTTP::Post.new(uri_state, {
		    'access-token'  => token_info["access-token"],
		    'client'        => token_info["client"],
		    'uid'           => token_info["uid"]
		}) # => #<Net::HTTP::Post POST>
		puts token_info
		req.body = device_state.to_json
		req.content_type = 'application/json'
		state_res = Net::HTTP.start(hostname_state, uri_state.port) do |http2|
		  http2.request(req)
		end
		return state_res
	end

	def get_commands(token_info)
		uri_state = URI('http://0.0.0.0:3000')
		hostname_state = uri_state.hostname # => "example.com"
		uri_state.path = '/devices/1/commands.json'
		req = Net::HTTP::Get.new(uri_state, {
		    'access-token'  => token_info["access-token"],
		    'client'        => token_info["client"],
		    'uid'           => token_info["uid"]
		}) # => #<Net::HTTP::Post POST>
		puts token_info
		req.content_type = 'application/json'
		state_res = Net::HTTP.start(hostname_state, uri_state.port) do |http2|
		  http2.request(req)
		end

		if state_res.code.to_i == 200
		  	commands = JSON.parse(state_res.body)
		  	return commands
		end
		
		return nil
	end

	def execute(commands)
		commands.each do |command|
			timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")
			puts "Executing command: #{command["command"]} of type: #{command["commandtype"]} at #{command["trigger_time"]}"
		end
	end

	def get_device_state
		state = Hash.new
		state["ip_address"] = get_ip_address()
		state["version"] = get_version()
	end

	def get_version
		return "Device simulator 0.1"
	end

	def get_ip_address
		ip = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
		return ip.ip_address
	end


end