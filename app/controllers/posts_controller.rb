#app/controllers/posts_controller.rb

class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]
   before_action :authenticate_user!, except: [:index, :show]
  # Index action to render all posts
  def index
    @posts = Post.all
  end

  # New action for creating post
  def new
    @post = Post.new
  end

  # Create action saves the post into database
  def create
    if current_user.admin?
      @post = Post.new(post_params)
      if @post.save
        flash[:notice] = "Successfully created post!"
        redirect_to post_path(@post)
      else
        flash[:alert] = "Error creating new post!"
        render :new
      end
    else
      flash[:notice] = "You are not an admin"
      redirect_to  new_post_path
    end
  end

  # Edit action retrives the post and renders the edit page
  def edit
  end

  # Update action updates the post with the new information
  def update
    if current_user.admin?
      if @post.update(post_params)
        flash[:notice] = "Successfully updated post!"
        redirect_to post_path(@post)
      else
        flash[:alert] = "Error updating post!"
        render :edit
      end
    else
      flash[:notice] = "You are not an admin"
      redirect_to post_path(@post)
     end
  end

  # The show action renders the individual post after retrieving the the id
  def show
  end

  # The destroy action removes the post permanently from the database
  def destroy
    if current_user.admin?
      if @post.destroy
        flash[:notice] = "Successfully deleted post!"
        redirect_to posts_path
      else
        flash[:alert] = "Error updating post!"
      end
    else
      flash[:notice] = "You are not an admin"
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :preview, :photo, :photo_cache)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
