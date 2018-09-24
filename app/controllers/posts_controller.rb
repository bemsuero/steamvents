class PostsController < ApplicationController
  def new
    if logged_in? || guest_logged_in?
    @post = Post.new
    @posts = Post.all
    else
    redirect_to new_user_path
    end
  end

  def create
    if logged_in?
      @post = Post.new(post_params)
      @post.generate_slug
      @post.user_id = current_user.id
      @post.guest_user_id = current_user.id
      @post.owner = current_user.username
      if @post.save
        redirect_to current_user
      else
        p @post.errors.messages
        render "new"
      end
    else
      @post = Post.new(post_params)
      @post.generate_slug
      @post.user_id = current_guest.id
      @post.guest_user_id = current_guest.id
      @post.owner = Cryptozoologist.full_name
      @post.save
      p @post.errors.messages
      redirect_to new_post_path
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:content, :owner)
  end

end
