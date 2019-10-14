FactoryBot.define do
    factory :recipe do
        association :category, factory: :category
        name { Faker::Food.ingredient }
        description { Faker::Food.description }
    end
end
