# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_admin = User.create(email: 'admin@gmail.com', password: 'qwerty', first_name: 'admin', last_name: '', user_name: 'admin')
user_admin.add_role(:admin)