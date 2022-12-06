class AgenciesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @agencies = Agency.order(:name).page params[:page]
    if params[:query].present?
      @agencies = Agency.search_by_name(params[:query])
    else
      @agencies = Agency.order(:name).page params[:page]
    end
  end

  def show
    @agency = Agency.find(params[:id])
  end
end
