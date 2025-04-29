class PostController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, success: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
      flash.now[:error] = "An error occured!"
    end
  end

  private

  def post_params
    params.expect(post: [ :title, :content ])
  end
  
end
