FactoryBot.define do
  factory :post do
    title Faker::Name.name
    content Faker::Lorem.paragraph
  end
end