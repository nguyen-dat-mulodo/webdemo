class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    # @products = Product.all
    #use for query object
    @products = ProductQuery.new(sort_query_params).all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @supports = Supports::Product.new @product
  end

  # GET /products/new
  def new
    @categories = Category.get_category
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @categories = Category.get_category
    @supports = Supports::Product.new @product
  end

  # POST /products
  # POST /products.json
  def create
    #Code for forms object
    @product = ProductForm.new(product_params)
    # @product = Product.new(product_params)
    @categories = Category.get_category
    #TODO: design pattern - form object
    if @product.insert(product_params)
      redirect_to products_url, notice: 'Product was successfully created.'
    else
      render json: @form.errors, status: :unpocessably_entity
    end

    # begin
    #   @product.create
    # rescue => e
    #   # logger.error "Attempt to access invalid cart #{params[:id]}"
    #   # redirect_to root_path, :notice => "Exists category ID"
    #   logger.error "products_controller::create => exception #{e.class.name} : #{e.message}"
    #   redirect_to root_path, flash[:error] = "<br/>Detailed error"
    # end

    # respond_to do |format|
    #   if @product.save
    #     format.html { redirect_to @product, notice: 'Product was successfully created.' }
    #     format.json { render :show, status: :created, location: @product }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #     #  format.json { render :json => { :error => @product.errors } }
    #   end
    # end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
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

    def product_form_params
      params.require(:product_form).permit :title, :description, :image_url, :price, :category_id
    end

    #use for query object
    def sort_query_params
      { sort: :by_title, type: :desc }
    end
end
