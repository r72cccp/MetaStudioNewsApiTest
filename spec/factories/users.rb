# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    name { Faker::Name.name }
    password { Faker::Internet.password min_length: 10, max_length: 20, mix_case: true }
    password_confirmation { password }
    sequence(:email) { |n| "email-#{n + 500_000}@example.com" }
  end
end
