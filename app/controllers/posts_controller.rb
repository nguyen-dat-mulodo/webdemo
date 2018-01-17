class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.js { redirect_to @post, notice: 'Post was successfully created by ajax.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.js
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated. ' }
        format.js { redirect_to @post, notice: 'Post was successfully updated by ajax. ' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.js
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.js { redirect_to posts_url, notice: 'Post was successfully destroyed by ajax.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :quantity, :image)
    end
end
