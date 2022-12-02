class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @message = Message.new
    @messages = Message.where(post_id: params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @topic = Topic.find(params[:topic_id])
    @post.topic = @topic
    if @post.save
      redirect_to topic_path(@topic)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :title)
  end
end
