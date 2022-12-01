class MessagesController < ApplicationController
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

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
