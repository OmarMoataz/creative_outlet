# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Name.name }
    content { Faker::Lorem.paragraph }
    description { Faker::Lorem.paragraph }
  end
end
