require 'ffaker'
FactoryGirl.define do
  factory :post do
    title { FFaker::Book.title }
    content { FFaker::Book.description }
    quantity { FFaker::Random.rand(1..100) }
  end
end