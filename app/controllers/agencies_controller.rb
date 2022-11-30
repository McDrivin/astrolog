class AgenciesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @agencies = Agency.all
  end

  def show
    @agency = Agency.find(params[:id])
  end
end
