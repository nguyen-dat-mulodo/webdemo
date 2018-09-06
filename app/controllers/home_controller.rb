class HomeController < ApplicationController
  def index
    @products = Product.all
  end
  def post_display
    @posts = Post.includes(:user).all
    render "home/post"
  end
end
