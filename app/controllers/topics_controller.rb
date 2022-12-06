class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :destroy]
  def index
    @topics = Topic.all
    @my_interests = TopicMember.where(user_id: current_user.id, role: 'member')
    @my_topics = TopicMember.where(user_id: current_user.id, role: 'creator')
  end

  def show
    @topic = Topic.find(params[:id])
    @current_user_topic_member = @topic.find_topic_member(current_user)
    @creator = User.find(@topic.topic_members.find_by(role: 'creator').user_id)
    @posts = Post.where(topic_id: params[:id])
    @post = Post.new
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic_member = @topic.topic_members.build(role: 'creator', user: current_user)
    if @topic.save
      redirect_to topics_path
      @topic_member.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @topic.destroy
      redirect_to topics_path, status: :see_other, notice: "Topic successfully deleted."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end
