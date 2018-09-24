class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    if logged_in?
      @post = Post.new(post_params)
      @post.generate_slug
      @post.user_id = current_user.id
      @post.guest_user_id = current_user.id
      if @post.save
        redirect_to current_user
      else
        p @post.errors.messages
        render "new"
      end
    else
      @post = Post.new(post_params)
      @post.generate_slug
      @post.user = User.new()
      @post.user_id = current_guest.id
      @post.guest_user_id = current_guest.id
      p @post.errors.messages
      redirect_to root_path
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
