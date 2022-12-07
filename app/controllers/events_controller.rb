class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @events = Event.order(:date).page params[:page]
    if params[:query].present?
      @events = Event.search_by_name(params[:query]).page params[:page]
    else
      @events = Event.order(:date).page params[:page]
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
