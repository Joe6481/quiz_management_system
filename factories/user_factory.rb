# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username  { Faker::Name.name }
    name    { Faker::Name.first_name }
    email   { Faker::Internet.email }
    role { [] }
    password { "password" }
    password_confirmation { "password" }
  end
end
