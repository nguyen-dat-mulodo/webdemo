class Post < ApplicationRecord
  validates :title, :content, :quantity,  presence: true
  validates :title, uniqueness: true
  validates :title, length: { minimum: 5 }
  validates :title, length: { maximum: 50 }
  validates :content, length: { minimum: 10 }
  validates :quantity, numericality: { only_integer: true, :greater_than => 0}
end