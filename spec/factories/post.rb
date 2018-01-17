require 'ffaker'
require 'faker'
FactoryGirl.define do
  factory :post do
    title { FFaker::Book.title }
    content { FFaker::Book.description }
    quantity { Faker::Number.between(1, 100)}
  end
end