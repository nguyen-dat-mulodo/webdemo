class Post < ApplicationRecord
  has_many :interactions, :dependent => :destroy
  has_many :users, through: :interactions

  validates :title, :uniqueness => true
  validates :title, :content, :presence => true
end
