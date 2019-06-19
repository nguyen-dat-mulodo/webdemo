class HomeController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(12).order('created_at desc')
  end

  def post_display
    @posts = Post.includes(:user).all
  end
end
