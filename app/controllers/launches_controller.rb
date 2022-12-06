class LaunchesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @launches = Launch.order(:window_start).page params[:page]
    if params[:query].present?
      @launches = Launch.search_by_name(params[:query])
    else
      @launches = Launch.order(:window_start).page params[:page]
    end
  end

  def show
    @launch = Launch.find(params[:id])
  end
end
