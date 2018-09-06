class Post < ApplicationRecord
  has_one :interaction, :dependent => :destroy
  has_one :user, through: :interaction
  # has_many :comments, dependent: :destroy
  # belongs_to :user
  validates :title, :uniqueness => true
  validates :title, :content, :presence => true
end
