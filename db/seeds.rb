User.destroy_all
userDetails = [
    {
        email: 'sharukhan@admin.com',
        name: 'sharukhan',
        role: 'admin',
        password: '123456',
        is_active: 1
    },
    {
        email: 'sharukhan@dealer.com',
        name: 'sharukhan',
        role: 'dealer',
        password: '123456',
        is_active: 1
    },
    {
        email: 'sharukhan@customer.com',
        name: 'sharukhan',
        role: 'customer',
        password: '123456',
        is_active: 1
    },
]

a = User.create(userDetails[0])
d = User.create(userDetails[1])
c = User.create(userDetails[2])

store = {
    name: d.name || d.email,
    location: 'delhi',
    rating: 4
}

dd = d.create_store(store)

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