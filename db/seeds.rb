require "json"
require "open-uri"
require "faker"

def fetch_api(end_point)
  all_data = []
  base_url = "https://lldev.thespacedevs.com/2.2.0/#{end_point}"
  # count = JSON.parse(URI.open(url).read)["count"]
  2.times do |index|
    url = "#{base_url}?offset=#{index}"
    puts "Fetching from url: #{url}"
    data = JSON.parse(URI.open(url).read)
    all_data.concat(data["results"])
  end
  return all_data
end

agencies = fetch_api("agencies")
astronauts = fetch_api("astronaut")
launches = fetch_api("launch/upcoming")
events = fetch_api("event/upcoming")

agencies.each do |agency|
  Agency.create(
    name: agency["name"],
    agency_type: agency["type"],
    country_code: agency["country_code"],
    description: agency["description"],
    founding_year: agency["founding_year"],
    spacecraft: agency["spacecraft"],
    image_url: agency["image_url"],
    logo_url: agency["logo_url"]
  )
end

astronauts.each do |astronaut|
  Astronaut.create(
    name: astronaut["name"],
    status: astronaut["status"]["name"],
    agency: astronaut["agency"]["name"],
    profile_image: astronaut["profile_image"]
  )
end

launches.each do |launch|
  Launch.create(
    name: launch["name"],
    status: launch["status"]["name"],
    status_desc: launch["status"]["description"],
    window_start: launch["window_start"],
    window_end: launch["window_end"],
    probability: launch["probability"],
    agenc: launch["launch_service_provider"]["name"],
    rocket: launch["rocket"]["configuration"]["name"],
    mission: launch["mission"]["name"],
    pad: launch["pad"]["name"],
    pad_lat: launch["pad"]["latitude"],
    pad_lng: launch["pad"]["longitude"]
  )
end

events.each do |event|
  Event.create(
    name: event["name"],
    description: event["description"],
    location: event["location"],
    news_url: event["news_url"],
    video_url: event["video_url"],
    feature_image: event["feature_image"],
    date: event["date"],
    event_type: event["type"]["name"]
  )
end

# ------------SEEDS FOR COMMUNITY-------------------
puts "Start seeding community"
emails = ["test@test.com", "user@gmail.com"]
2.times do |i|
  User.create(
    username: Faker::Internet.username,
    email: emails[i],
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: 'secret'
  )
end

5.times do
  Topic.create(title: Faker::Space.company, description: Faker::Lorem.sentence(word_count: 3))
end

20.times do
  Post.create(
    content: Faker::Lorem.paragraph(sentence_count: 3),
    user: User.find(rand(1..2)),
    topic: Topic.find(rand(1..5))
  )
end

50.times do
  Message.create(
    content: Faker::Lorem.paragraph(sentence_count: 3),
    post: Post.find(rand(1..20)),
    user: User.find(rand(1..2))
  )
end
puts "End seeding community"

url = "http://api.open-notify.org/astros.json"
user_serialized = URI.open(url).read
@user = JSON.parse(user_serialized)
