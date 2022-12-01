class TopicMembersController < ApplicationController
  #  POST /topics/:topic_id/topic_members
  def create
    @topic_member = TopicMember.new
    @topic = Topic.find(params[:topic_id])
    @topic_member.topic = @topic
    @topic_member.user = current_user
    if @topic_member.save
      redirect_to @topic, status: :see_other, notice: "You've joined this topic"
    else
      redirect_to @topic, status: :unprocessable_entity, alert: "Something went wrong, please try again"
    end
  end

  # DELETE /topic_members/:id
  def destroy
    @topic_member = TopicMember.find(params[:id])
    @topic_member.destroy
    redirect_to @topic_member.topic, status: :see_other, notice: "Successfully left topic"
  end

  private

  def tm_params
    params.require(:topic_member).permit(:role)
  end
end
