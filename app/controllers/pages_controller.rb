require "json"
require "open-uri"
require "uri"
require "net/http"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :launches, :events, :agencies, :astronauts ]

  def home
  end

  def launches
  end

  def events
    @events = fetch_events
  end

  def agencies
  end

  def astronauts
  end

  private

  def fetch_events
  end
end
