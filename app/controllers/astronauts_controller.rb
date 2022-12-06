class AstronautsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @astronauts = Astronaut.all
    if params[:query].present?
      @astronauts = Astronaut.search_by_name(params[:query])
    else
      @astronauts = Astronaut.all
    end
  end

  def show
    @astronaut = Astronaut.find(params[:id])
  end
end
