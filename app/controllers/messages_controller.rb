class MessagesController < ApplicationController
  before_action :set_message, only: [:destroy, :edit, :update]

  def create
    @message = Message.new(message_params)
    @post = Post.find(params[:post_id])
    @message.user = current_user
    @message.post = @post

    if @message.save
      redirect_to post_path(@post)
    else
      render "posts/new", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Message was updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(@message.post_id)
    @message.destroy
    redirect_to post_path(@post), status: :see_other, alert: "Message was deleted successfully."
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
