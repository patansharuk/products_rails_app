FactoryBot.define do
    factory :product do
        title { Faker::Commerce.product_name }
        description { Faker::Lorem.sentence }
    end
end