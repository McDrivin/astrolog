require "json"

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

  # def self.article_api
  #   url = "https://api.spaceflightnewsapi.net/v3/articles"
  #   request_to_article_api = Net::HTTP.get(URI(url))
  #   JSON.parse request_to_article_api
  # end
  articles = article_fetch_api("articles")

  def article_fetch_api(end_point)
    all_data = []
    base_url = "https://api.spaceflightnewsapi.net/v3/articles"
    # count = JSON.parse(URI.open(url).read)["count"]
    2.times do |index|
      url = "#{base_url}?offset=#{index}"
      puts "Fetching from url: #{url}"
      data = JSON.parse(URI.open(url).read)
      all_data.concat(data["results"])
    end
    return all_data
  end

  articles.each do |article|
    Article.create(
      id: article["id"]
      title: article["title"]
      url: article["url"]
      imageUrl: article["imageUrl"]
      newsSite: article["newsSite"]
      summary: article["summary"]
      publishedAt: article["publishedAt"]
      updatedAt: article["updatedAt"]
      featured: article["featured"]
      launches: article["id"]["provider"]
    )
  end
end
