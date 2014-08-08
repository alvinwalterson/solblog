# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html


puts 'Create Locations...'
Location.destroy_all

locations = [
	{name: 'Paris', picture: 'paris1.jpg'},
	{name: 'Santorini', picture: 'above-blue-suites-santorini-gen.jpg'},
	{name: 'Tulum', picture: '006_tulum_theredlist.jpg'},
	{name: 'Cinque Terre', picture: 'italian-riviera-cinque-terre.jpg'}
]

locations.each do |l|
	picture = File.open("#{Rails.root}/app/assets/images/#{l[:picture]}")
	location = Location.create(name: l[:name])

	photo = Photo.new(title: l[:name], picture: picture, url: 'javascript:void(0)')
	photo.location_id = location.id
	photo.save
end

