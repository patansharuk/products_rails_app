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

dd = d.create_dealer_detail(dealer_detail)

product_detail = [
    {
        title: 'mango',
        description: 'mango is a seasional fruit.',
        price: 120,
        image_url: ''
    },
    {
        title: 'guaua',
        description: 'guaua is a daily available fruit.',
        price: 1000,
        image_url: ''
    }
]

prod1 = dd.products.create(product_detail[0])
prod2 = dd.products.create(product_detail[1])