class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @events = Event.order(:date).page params[:page]
  end

  def show
    @event = Event.find(params[:id])
  end
end
