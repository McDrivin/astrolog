class NasaPictureController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @nasa_info = NasaApi.get_api_info
    @media_type_is_video = @nasa_info['media_type'].eql?('video')
    # @in_space = NasaApi.ppl_in_space_api
    @in_space = NasaApi.ppl_in_space_api
    @articles = Article.first(8)
    @mars_rover = NasaApi.mars_rover_api["latest_photos"].first
  end

end
