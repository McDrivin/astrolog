require "json"
require_relative "article.rb"

class NasaApi < ApplicationRecord
  def self.get_api_info
    nasa_api = "https://api.nasa.gov/planetary/apod?api_key=#{ENV['NASA_API_KEY']}"
    request_to_nasa_api = Net::HTTP.get(URI(nasa_api))
    JSON.parse request_to_nasa_api
  end

  def self.ppl_in_space_api
    url = "http://api.open-notify.org/astros.json"
    request_to_nasa_api = Net::HTTP.get(URI(url))
    JSON.parse request_to_nasa_api
  end

  def self.article_api
    url = "https://api.spaceflightnewsapi.net/v3/articles"
    request_to_article_api = Net::HTTP.get(URI(url))
    JSON.parse request_to_article_api
  end
end
