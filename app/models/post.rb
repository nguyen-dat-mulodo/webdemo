class Post < ApplicationRecord
  has_many :interactions, :dependent => :destroy
  has_many :users, through: :interactions
end
