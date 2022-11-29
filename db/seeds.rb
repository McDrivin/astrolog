require "json"
require "open-uri"

all_events = []

base_url = "https://lldev.thespacedevs.com/2.2.0/event"

10.times do |index|
  url = "#{base_url}?offset=#{index}"
  puts "Fetching from url: #{url}"
  results = URI.open(url).read
  events = JSON.parse(results)
  all_events.concat(events["results"])
end

p all_events.count
