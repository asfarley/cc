require 'net/http'
require 'uri'
require 'json'

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
else
  puts "Login failed"
  exit
end


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

puts "Command Get response: #{state_res}"