class Supports::Product
  attr_reader :product

  def initialize product
    @product = product
  end

  def category
    @category ||= Product.categories
  end

end