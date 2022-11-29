class AstronautsController < ApplicationController

  def index
    @astronauts = Astronaut.all
  end

  def show
    @astronaut = Astronaut.find(params[:id])
  end
end
