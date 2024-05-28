FactoryBot.define do
    factory :admin, class: 'User' do
        email { 'sharukhan@webkorps.com' }
        password { "123456" }
        role { 'admin' }
    end

    factory :dealer, class: 'User' do
        email { 'salmankhan@webkorps.com' }
        password { '123456' }
        role { 'dealer' }
    end

    factory :customer , class: 'User' do
        email { 'amirkhan@webkorps.com' }
        password { '123456' }
        role { 'customer' }
    end
end