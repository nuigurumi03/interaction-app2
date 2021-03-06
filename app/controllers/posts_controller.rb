class PostsController < ApplicationController
  PER = 6

  def index
    @posts = Post.includes(:images).order('created_at DESC')
    @posts = Post.page(params[:page]).per(6).order('created_at DESC')
  end

  def new
    @post = Post.new
    @image = Image.new
    @post.images.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @posts = Post.find(params[:id])
    @image = Image.find(params[:id])
    @message = Message.new
    @messages = @posts.messages.includes(:user)
  end

  def edit
    @post = Post.find(params[:id])
    @image = Image.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @image = Image.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def search
    @search_params = params[:keyword]
    @posts = Post.search(@search_params).order("created_at DESC")
    @count = @posts.count
  end

  private

  def post_params
    params.require(:post).permit(:title, :detail, :prefecture_id, :city, :house_code, :build_name, images_attributes: [:image, :id]).merge(user_id:current_user.id)
  end

end
