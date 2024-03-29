# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    role

    after(:create) do |user|
      user.set_role('writer')
      user.save
    end

    factory :user_with_role_reader do
      role factory: :role, name: 'reader'
    end

    factory :user_with_posts do
      transient do
        posts_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user: user)
      end
    end
  end
end
