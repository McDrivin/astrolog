class LaunchesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @launches = Launch.order(:window_start).page params[:page]
  end

  def show
    @launch = Launch.find(params[:id])
  end
end
