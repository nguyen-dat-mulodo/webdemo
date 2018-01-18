require "rails_helper"

RSpec.describe PostsController, :type => :controller do

  describe "#index" do
    it "assigns @posts" do
      post = FactoryGirl.create(:post)
      get :index
      expect(assigns(:posts)).to eq([post])
      #assert_equal Post.all, assigns(:posts)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "#show" do
    it "assigns @post" do
      post = FactoryGirl.create(:post)
      get :show, params: { id: post.id }
      expect(assigns(:post)).to eq(post)
    end
    
    it "renders the show template" do
      get :show,  params: { id: FactoryGirl.create(:post).id }
      expect(response).to render_template :show
    end
  end

  describe "#create" do
    login_user
    new_post = {title: 'Post title', content: 'Post content', quantity: 1}
    context "when attributes is valid" do
      it "creates a new post" do
        expect do
          post :create, params: { post: new_post }
        end.to change(Post,:count).by(1)
      end
      
      it "redirects to the post" do
        post :create, params: { post: new_post }
        expect(response).to redirect_to Post.last
      end
    end
  end

  describe "#destroy" do
    login_user
    before :each do
      @post = FactoryGirl.create(:post)
    end
    
    it "deletes the post" do
      expect{
        delete :destroy, params: { id: @post }
      }.to change(Post,:count).by(-1)
    end
      
    it "redirects to post#index" do
      delete :destroy, params: { id: @post }
      expect(response).to redirect_to posts_url
    end
  end

end