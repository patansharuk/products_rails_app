
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

a = User.create(userDetails[0])
d = User.create(userDetails[1])
c = User.create(userDetails[2])

dealer_detail = {
    name: d.name || d.email,
    location: 'delhi',
    rating: 4
}

dd = d.create_dealer_details(dealer_detail)
