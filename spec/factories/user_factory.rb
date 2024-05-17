FactoryBot.define do
    factory :user do
        email { Faker::ESM.email }
    end
end