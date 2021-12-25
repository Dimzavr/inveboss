class PostsController < ApplicationController
  
  before_action :set_post, only: [ :show, :edit, :update, :destroy]

  def index
  	@posts = Post.paginate(page: params[:page], per_page: 5)
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Post successfully created '
    else
      flash.now[:danger] = 'Post not created'
      render :new
    end    
  end

  def edit
    
  end

  def update
    if @post.update(post_params)
      redirect_to @post, success: 'Post updated successfully'
    else
      flash.now[:danger] = 'Post not updated'
      render :edit
    end    
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Post successfully deleted'
  end  

  private
    
  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :content, :all_tags, :category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end	