FactoryBot.define do
    factory :users do
        username { Faker::Internet.username }
        email { Faker::Internet.email }
        password { Faker::Internet.password}
    end
end