class NasaPictureController < ApplicationController
  def index
    @nasa_info = NasaApi.get_api_info
    @media_type_is_video = @nasa_info['media_type'].eql?('video')
    # @in_space = NasaApi.ppl_in_space_api
    @in_space = NasaApi.ppl_in_space_api
  end
end
