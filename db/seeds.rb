# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


user = User.new(:email => ENV["ADMIN_EMAIL"],
	:password => ENV["ADMIN_PASSWORD"],
	:password_confirmation => ENV["ADMIN_PASSWORD"]
)
user.save!

device1 = Device.new(:name => "Prometheus")
device1.save!

device2 = Device.new(:name => "Romulus")
device2.save!

device3 = Device.new(:name => "Remus")
device3.save!