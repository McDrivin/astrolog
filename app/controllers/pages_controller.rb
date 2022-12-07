require "json"
require "open-uri"
require "uri"
require "net/http"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @nasa_info = NasaApi.nasa_picture
    @media_type_is_video = @nasa_info['media_type'].eql?('video')

    @in_space = NasaApi.ppl_in_space_api
    @articles = Article.first(8)
    @mars_rover = NasaApi.mars_rover_api["latest_photos"].first
  end
end
