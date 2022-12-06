class LaunchesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @launches = Launch.all
    if params[:query].present?
      @launches = Launch.search_by_name(params[:query])
    else
      @launches = Launch.all
    end
  end

  def show
    @launch = Launch.find(params[:id])
  end
end
