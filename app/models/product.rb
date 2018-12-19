class Product < ApplicationRecord
  # self.default_scope :order => 'title'

  has_many :line_items
  belongs_to :category, foreign_key: :category_id
  before_destroy :line_item_referencing_product
  has_attached_file :image, styles: { :x_large => "800x800#",
                                      :large => "400x400#",
                                      :medium => "200x200#",
                                      :small => "100x100#" }
  validates_attachment :image, content_type: { content_type: %w(image/jpeg image/gif image/png)},
                       size: { less_than: 4.megabyte },presence: true

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
