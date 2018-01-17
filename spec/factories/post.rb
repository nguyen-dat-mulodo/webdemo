require 'ffaker'
FactoryGirl.define do
  factory :post do
    title { FFaker::Book.title }
    content { FFaker::Book.description }
    quantity { 5 }
  end
end