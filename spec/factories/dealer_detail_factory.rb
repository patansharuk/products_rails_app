FactoryBot.define do
    factory :dealer1, class: 'DealerDetail' do
        name { 'user_name' }
        location { 'china' }
        rating { 1 }
        user { association :dealer }
    end

    factory :dealer2, class: 'DealerDetail' do
        name { 'user_name' }
        location { 'china' }
        rating { 1 }
        user { association :admin }
    end
end
