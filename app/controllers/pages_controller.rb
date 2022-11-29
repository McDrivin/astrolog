require "json"
require "open-uri"
require "uri"
require "net/http"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end
end
