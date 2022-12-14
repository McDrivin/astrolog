require "json"
require_relative "article.rb"
require "open-uri"

class NasaApi < ApplicationRecord
  def self.nasa_picture
    nasa_api = "https://api.nasa.gov/planetary/apod?api_key=#{ENV['NASA_API_KEY']}"
    request_to_nasa_api = Net::HTTP.get(URI(nasa_api))
    JSON.parse request_to_nasa_api
  end

  def self.ppl_in_space_api
    url = "http://api.open-notify.org/astros.json"
    request_to_nasa_api = Net::HTTP.get(URI(url))
    JSON.parse request_to_nasa_api
  end

  def self.mars_rover_api
    url = "https://api.nasa.gov/mars-photos/api/v1/rovers/perseverance/latest_photos?api_key=#{ENV['NASA_API_KEY']}"
    request_to_nasa_api = Net::HTTP.get(URI(url))
    JSON.parse request_to_nasa_api
  end
end
