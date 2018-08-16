class Product
  include ActiveModel::Model

  attr_accessor :title, :price, :email, :description, :image_url
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {greater_than_or_equal_to: 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
      :with => /\.(gif|jpg|png)/i,
      :message => "must be GIF, JPG or PNG"
  }
  def save
    if valid?
      creat_product

      true
    else
      sent_notifications
      false
    end
  end

  private
  def creat_product
    @product.build
  end

  def sent_notifications
    # sent email to admin if error
  end
end