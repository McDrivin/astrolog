require "json"

class Article < ApplicationRecord
end

# def self.article_api
#   url = "https://api.spaceflightnewsapi.net/v3/articles"
#   request_to_article_api = Net::HTTP.get(URI(url))
#   JSON.parse request_to_article_api
# end
