class PostsController < ApplicationController

  def index
  end

  def new
    @post = Post.new
    @image = Image.new
    @post.images.new
  end
  
end
