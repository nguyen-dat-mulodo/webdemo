class Category < ApplicationRecord

  enum gender: {male: 0, female: 1, not_set: 2}

  has_many :products, :dependent => :destroy
  belongs_to :user
  validates :cat_name, :cat_content, :presence => true
  validates :cat_name, :uniqueness => true

  def self.get_category
    select('id, cat_name, cat_content').order('cat_name asc')
  end

end
