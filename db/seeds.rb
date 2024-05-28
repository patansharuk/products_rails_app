# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
userDetails = [
    {
        email: 'sharukhan@webkorps.com',
        name: 'sharukhan',
        role: 'admin',
        password: '123456',
        is_active: 1
    },
    {
        email: 'salmankhan@webkorps.com',
        name: 'salmankhan',
        role: 'dealer',
        password: '123456',
        is_active: 1
    },
    {
        email: 'amirkhan@webkorps.com',
        name: 'amirkhan',
        role: 'customer',
        password: '123456',
        is_active: 1
    },
]

u1 = User.create(userDetails[0])
u2 = User.create(userDetails[1])
u3 = User.create(userDetails[2])
