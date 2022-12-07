class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @events = Event.order(:date).page params[:page]
    if params[:query].present?
      @events = Event.search_by_name(params[:query])
    else
      @events = Event.order(:date).page params[:page]
    end
  end

  def show
    @event = Event.find(params[:id])
    video_url = @event.video_url
    @embed_video = "https://www.youtube.com/embed/#{video_url.split("v=").last}"
    @embed_id = video_url.split("v=").last
  end
end
