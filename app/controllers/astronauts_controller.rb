class AstronautsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @astronauts = Astronaut.order(:name).page params[:page]
  end

  def show
    @astronaut = Astronaut.find(params[:id])
  end
end
