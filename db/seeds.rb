# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
	first_name: "Jefferson",
	last_name: "Cunha",
	username: "jefferson",
	email: "jeffersondasilva14@gmail.com",
	birth_date: "14/05/1994",
	password: "12345678",
	admin: true,
	password_confirmation: "12345678"
)
