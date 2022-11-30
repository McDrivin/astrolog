class LaunchesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @launches = Launch.all
    @markers = @launches.geocoded.map do |launch|
      {
        lat: launch.pad_lat,
        lng: launch.pad_lng
      }
    end
  end

  def show
    @launch = Launch.find(params[:id])
  end
end
