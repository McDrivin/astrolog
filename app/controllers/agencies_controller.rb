class AgenciesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @agencies = Agency.all
    if params[:query].present?
      @agencies = Agency.search_by_name(params[:query])
    else
      @agencies = Agency.all
    end
  end

  def show
    @agency = Agency.find(params[:id])
  end
end
