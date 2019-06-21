class Api::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    #use for query object
    @products = ProductQuery.new(sort_query_params).all.page(params[:page]).per(12).order('created_at desc')
  end

  def show
    @supports = Supports::Product.new @product
  end

  def create
    @product = ProductForm.new(product_params)
    @categories = Category.get_category
    product = @product.insert(product_params)
    if product
      render json: product
    else
      render json: @product.errors, status: :unpocessably_entity
    end
  end

  def destroy
    @product.destroy
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price, :category_id)
  end

  #use for query object
  def sort_query_params
    { sort: :by_title, type: :desc, gender: :male }
  end
end
