class Product < ApplicationRecord
  # self.default_scope :order => 'title'

  has_many :line_items
  belongs_to :category, foreign_key: :category_id
  before_destroy :line_item_referencing_product
  has_attached_file :image, styles: { :large => "800x800#",
                                      :medium => "240x240#",
                                      :small => "100x100#" }
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
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
