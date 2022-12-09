require "json"
require "open-uri"
require "faker"

def parse_data(end_point)
  all_data = []
  base_url = "https://lldev.thespacedevs.com/2.2.0/#{end_point}"
  count = (JSON.parse(URI.open(base_url).read)["count"] / 10)
  puts "Fetching #{end_point} for #{count} times..."
  count.times do |index|
    url = "#{base_url}?limit=10&offset=#{index * 10}"
    puts "Fetching from url: #{url}"
    data = JSON.parse(URI.open(url).read)
    all_data.concat(data["results"])
  end
  return all_data
end

agencies = parse_data("agencies")
astronauts = parse_data("astronaut")
launches = parse_data("launch/upcoming")
events = parse_data("event/upcoming")

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
    status: astronaut["status"] ? astronaut["status"]["name"] : nil,
    agency: astronaut["agency"] ? astronaut["agency"]["name"] : nil,
    profile_image: astronaut["profile_image"],
    age: astronaut["age"],
    date_of_birth: astronaut["date_of_birth"],
    date_of_death: astronaut["date_of_death"],
    nationality: astronaut["nationality"],
    twitter: astronaut["twitter"],
    instagram: astronaut["instagram"],
    bio: astronaut["bio"],
    wiki: astronaut["wiki"]
  )
end

launches.each do |launch|
  Launch.create(
    name: launch["name"],
    status: launch["status"] ? launch["status"]["name"] : nil,
    status_desc: launch["status"] ? launch["status"]["description"] : nil,
    window_start: launch["window_start"],
    window_end: launch["window_end"],
    probability: launch["probability"],
    agenc: launch["launch_service_provider"] ? launch["launch_service_provider"]["name"] : nil,
    rocket: launch["rocket"] ? launch["rocket"]["configuration"]["name"] : nil,
    mission: launch["mission"] ? launch["mission"]["name"] : nil,
    pad: launch["pad"] ? launch["pad"]["name"] : nil,
    pad_lat: launch["pad"] ? launch["pad"]["latitude"] : nil,
    pad_lng: launch["pad"] ? launch["pad"]["longitude"] : nil
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
    event_type: event["type"] ? event["type"]["name"] : nil
  )
end

puts "Parsing articles..."
def parse_articles
  base_url = "https://api.spaceflightnewsapi.net/v3/articles"
  puts "Fetching from url: #{base_url}"
  data = JSON.parse(URI.open(base_url).read)
  return data
end

articles = parse_articles

articles.each do |article|
  Article.create(
    title: article["title"],
    url: article["url"],
    imageUrl: article["imageUrl"],
    newsSite: article["newsSite"],
    summary: article["summary"],
    publishedAt: article["publishedAt"],
    updatedAt: article["updatedAt"],
    featured: article["featured"]
  )
end

# puts "Seeding community..."
# emails = ["test@test.com", "user@gmail.com"]
# 2.times do |i|
#   User.create(
#     username: Faker::Internet.username,
#     email: emails[i],
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     password: 'secret'
#   )
# end

# 5.times do |i|
#   topic = Topic.create(title: "This is topic #{i + 1}", description: Faker::Lorem.sentence(word_count: 3))
#   topic.topic_members.create(role: 'creator', user: User.find(rand(1..2)))
#   # topic.save
# end

# Topic.all.each do |topic|
#   10.times do |j|
#     Post.create(
#       title: "This is the post #{j + 1} of topic #{topic.id}",
#       content: "This is content of post #{j + 1} of topic #{topic.id}",
#       user: User.find(rand(1..2)),
#       topic: topic
#     )
#   end

#   Post.all.each do |post|
#     5.times do |j|
#       Message.create(
#         content: "This is message #{j + 1} of post #{post.id}",
#         post: post,
#         user: User.find(rand(1..2))
#       )
#     end
#   end
# end
# puts "Seeding successfully finished!"
