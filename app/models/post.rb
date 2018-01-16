class Post < ApplicationRecord
  validates :title, length: { minimum: 5, maximum: 50 }, uniqueness: true,  presence: true
  validates :content, length: { minimum: 10 }, presence: true
  validates :quantity, numericality: { only_integer: true, :greater_than => 0}, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, size: { less_than: 4.megabyte }
end