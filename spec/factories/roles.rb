# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { 'writer' }
    description { Faker::Lorem.paragraph }
  end
end
