class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :edit, :update]
  def show
    @topic = Topic.find(@post.topic_id)
    @user = User.find(@post.user_id)
    @message = Message.new
    @messages = Message.where(post_id: params[:id]).page params[:page]
    add_breadcrumb "Home", topics_path
    add_breadcrumb @topic.title, topic_path(@topic)
    add_breadcrumb @post.title, post_path(@post)
  end

  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
    add_breadcrumb "Home", topics_path
    add_breadcrumb @topic.title, topic_path(@topic)
    add_breadcrumb "New discussion", new_topic_post_path(@topic)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @topic = Topic.find(params[:topic_id])
    @post.topic = @topic
    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @topic = Topic.find(@post.topic_id)
    add_breadcrumb "Home", topics_path
    add_breadcrumb @topic.title, topic_path(@topic)
    add_breadcrumb @post.title, post_path(@post)
    add_breadcrumb "Edit discussion", edit_post_path
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @topic = Topic.find(@post.topic_id)
    @post.destroy
    redirect_to topic_path(@topic), status: :see_other, alert: "Post was deleted successfully."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :title, photos: [])
  end
end
