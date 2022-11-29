class AgenciesController < ApplicationController

  def index
    @agencies = Agency.all
  end

  def show
    @agency = Agency.find(params[:id])
  end
end
