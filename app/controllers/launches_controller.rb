class LaunchesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @launches = Launch.all
  end

  def show
    @launch = Launch.find(params[:id])
  end
end
