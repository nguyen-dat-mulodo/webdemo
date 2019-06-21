class ProductsController < ApplicationController
  # before_action :authenticate_user!

  # GET /products
  # GET /products.json
  def index
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @categories = Category.get_category
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @categories = Category.get_category
  end

  def product_for_gender
    status = params[:status]
    @products = ProductQuery.new(sort_query_params).all.page(params[:page]).per(12)
    if status == 'male'
      render 'index'
    elsif status == 'female'
      render 'index'
    else
      render 'error_page/html_not_found'
    end
  end

  private
    #use for query object
    def sort_query_params
      { sort: :by_title, type: :desc, gender: :male }
    end
end
