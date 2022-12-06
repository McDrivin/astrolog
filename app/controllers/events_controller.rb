class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @events = Event.all
    if params[:query].present?
      @events = Event.search_by_name(params[:query])
    else
      @events = Event.all
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
