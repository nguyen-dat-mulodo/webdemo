class Product < ApplicationRecord
  # self.default_scope :order => 'title'

  has_many :line_items
  belongs_to :category, foreign_key: :category_id
  before_destroy :line_item_referencing_product

  private
    def line_item_referencing_product
      if line_items.empty?
        true
      else
        errors.add(:base, 'line items present')
        false
      end
    end

end
