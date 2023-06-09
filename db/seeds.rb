require 'json'
require 'faker'
require "open-uri"

puts " Cleaning database..."

Chatroom.destroy_all
Founder.destroy_all
Investor.destroy_all
Sector.destroy_all
User.destroy_all

puts "Creating users"

file = URI.open("https://apicms.thestar.com.my/uploads/images/2022/06/09/1616593.jpg")
file1 = URI.open("https://images.hdqwalls.com/wallpapers/emma-watson-4k-img.jpg")
file2 = URI.open("https://i.pinimg.com/originals/cc/96/cf/cc96cf32c70bd77c6777b9425ffbd956.jpg")
file3 = URI.open("https://images.wsj.net/im-748400?width=1280&size=1")
file4 = URI.open("https://media.cnn.com/api/v1/images/stellar/prod/230320112730-04-donald-trump-file.jpg?c=16x9&q=h_720,w_1280,c_fill")
file5 = URI.open("https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iz01E_aJRczc/v1/1200x-1.jpg")
file6 = URI.open("https://5b0988e595225.cdn.sohucs.com/images/20190325/904f052efaaf4e8f821977903ebbd93a.jpeg")

user = User.create!(
  first_name: "Julie",
  last_name: "Goh",
  email: "juliegoh@gmail.com",
  password:"testing"
)
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpg")
user.save!

user1 = User.create!(
  first_name: "Angelina",
  last_name: "Lim",
  email: "angelina_lim@gmail.com",
  password:"testing"
)
user1.photo.attach(io: file1, filename: "user1.jpg", content_type: "image/jpg")
user1.save!

user2 = User.create!(
  first_name: "Dohyun",
  last_name: "Lee",
  email: "dohyun_lee@gmail.com",
  password:"testing"
)
user2.photo.attach(io: file2, filename: "user2.jpg", content_type: "image/jpg")
user2.save!

user3 = User.create!(
  first_name: "ShouZi",
  last_name: "Chew",
  email: "chew_shouzi@gmail.com",
  password:"testing"
)
user3.photo.attach(io: file3, filename: "user3.jpg", content_type: "image/jpg")
user3.save!

user4 = User.create!(
  first_name: "Trump",
  last_name: "Donald",
  email: "donald_trump@hotmail.com",
  password:"testing"
)
user4.photo.attach(io: file4, filename: "user4.jpg", content_type: "image/jpg")
user4.save!


user5= User.create!(
  first_name: "Jung Un",
  last_name: "Kim",
  email: "kimju_kiyomi@hotmail.com",
  password:"testing"
)
user5.photo.attach(io: file5, filename: "user5.jpg", content_type: "image/jpg")
user5.save!

user6= User.create!(
  first_name: "Takuya",
  last_name: " Kimura ",
  email: " Kimura_Takuya@hotmail.com",
  password:"testing"
)
user6.photo.attach(io: file6, filename: "user6.jpg", content_type: "image/jpg")
user6.save!


# TODO: Creating 5 sectors
puts "Creating sectors"

sectors = [
  Sector.create!(name: "Education"),
  Sector.create!(name: "Enterprise"),
  Sector.create!(name: "SaaS"),
  Sector.create!(name: "Big Data & Analytics"),
  Sector.create!(name: "Productivity"),
  Sector.create!(name: "Cybersecurity"),
  Sector.create!(name: "Supply Chain & Logistics"),
  Sector.create!(name: "Consumer"),
  Sector.create!(name: "Food & Beverage"),
  Sector.create!(name: "Future of Work"),
  Sector.create!(name: "Transportation"),
  Sector.create!(name: "Travel & Hospitality"),
  Sector.create!(name: "Healthcare"),
  Sector.create!(name: "AR & VR"),
  Sector.create!(name: "Health & Wellness"),
  Sector.create!(name: "InsurTech"),
  Sector.create!(name: "Aerospace & Space"),
  Sector.create!(name: "Climate & Sustainability")
]

puts "Creating founders"

image = URI.open("https://www.openvc.app/images/funds/recX1gBfCuouKRDgU.jpg")
image1 = URI.open("https://pbs.twimg.com/media/DRfkPZnV4AAiLmJ.jpg")
image2 = URI.open("https://i.pinimg.com/236x/1d/eb/8b/1deb8be04a7d1df94ae86febfa977315--design-art-logo-design.jpg")
image3 = URI.open("https://static.wikia.nocookie.net/degrassi/images/4/46/Yale-university-logo.jpg/revision/latest?cb=20111125110818")
image4 = URI.open("https://spaceexplored.com/wp-content/uploads/sites/10/2022/05/SpaceX-Dragon-heat-shield-anomoly.jpg")
image5 = URI.open("https://upload.wikimedia.org/wikipedia/en/6/63/Adventure_Inc_Titles.jpg")

founder = Founder.new(
  user: user,
  company_name: "CP Ventures",
  company_description: "Autio is an app that entertains listeners with bite-sized audio stories about history, landmarks, culture, and natural wonders for travel. Users can explore nearby stories based on their current location once they enable location access. When users are not driving, they can view a map of the United States and select stories based on theirinterests. The app also offers entertaining and educational content for RVers to enjoy while traveling across the country.",
  company_email: "cp_ventures@autio.com",
  company_UEN: "202345789X",
  funding_stage: "Seed",
  date_incorporated: "01.12.2023",
)

founder.sectors = sectors.sample(3)
founder.photo.attach(io: image, filename: "investor.jpg", content_type: "image/jpg")
founder.save!

founder1 = Founder.new(
  user: user1,
  company_name: "LOEN Entertainment",
  company_description: "Kakao M was a South Korean entertainment company established by Min Yeong-bin in 1978. It is currently one of the largest co-publisher companies in South Korea. The The company operates as a record label, talent agency, music production company, event management, concert production company, and music publishing house.",
  company_email: "loen_ent@autio.com",
  company_UEN: "201398789X",
  funding_stage: "Pre-Seed",
  date_incorporated: "21.11.2013",
)

founder1.sectors = sectors.sample(3)
founder1.photo.attach(io: image1, filename: "founder1.jpg", content_type: "image/jpg")
founder1.save!

founder2 = Founder.new(
  user: user2,
  company_name: "Toronto Transit",
  company_description: "Toronto transit operates automatic underground heavy rail system and provides train services through North East Line, Downtown Line, Sengkang-Punggol Light Rail Transit (SPLRT). SBS also provides advertisement services, which include advertisement space provided in outdoor, bus, in-train, interchange, and train station. ",
  company_email: "toronto_transit@autio.com",
  company_UEN: "200012789X",
  funding_stage: "Series A",
  date_incorporated: "10.9.2000",
)

founder2.sectors = sectors.sample(3)
founder2.photo.attach(io: image2, filename: "founder2.jpg", content_type: "image/jpg")
founder2.save!

founder3 = Founder.new(
  user: user3,
  company_name: "Oneday Yale",
  company_description: "The Ministry of Education (MOE) formulates and implements education policies on education structure, curriculum, pedagogy, and assessment. It oversees the management and development of Government-funded schools, and the Institute of Technical Education, polytechnics and universities.",
  company_email: "oneday_inyale@autio.com",
  company_UEN: "201412759X",
  funding_stage: "Series B",
  date_incorporated: "10.9.2014",
)

founder3.sectors = sectors.sample(3)
founder3.photo.attach(io: image3, filename: "founder3.jpg", content_type: "image/jpg")
founder3.save!

founder4 = Founder.new(
  user: user4,
  company_name: "SpaceX",
  company_description: "'You want to wake up in the morning and think the future is going to be great - and that's what being a spacefaring civilization is all about. And I can't think of anything more exciting than going out there and being among the stars.'-Elon Musk",
  company_email: "oneday_inyale@autio.com",
  company_UEN: "200499759X",
  funding_stage: "Series C",
  date_incorporated: "10.9.2004",
)

founder4.sectors = sectors.sample(3)
founder4.photo.attach(io: image4, filename: "founder4.jpg", content_type: "image/jpg")
founder4.save!

founder5 = Founder.new(
  user: user5,
  company_name: "Adventure Inc",
  company_description: "Adventure Inc engages in the provision of online travel services. It operates Skyticket and WANNATRIP website portals. The Skyticket website portal offers online ticket booking services for multiple airlines, both domestic and overseas. The WANNATRIP website portal offers package tours and cruise travel to various destinations.",
  company_email: "adventure_inc@autio.com",
  company_UEN: "200283759X",
  funding_stage: "Series C",
  date_incorporated: "10.9.2002",
)

founder5.sectors = sectors.sample(3)
founder5.photo.attach(io: image5, filename: "founder5.jpg", content_type: "image/jpg")
founder5.save!

# TODO: Creating 5 investors (investor_profile)
# load the investors.json file into memory
puts "Creating investors"

investors_json = File.read(File.join(__dir__, 'investors.json'))
# parse the json file as ruby
investors = JSON.parse(investors_json)

# ]
# {
#   "Name"=>"Y Combinator",
#   "Description"=>"Y Combinator is a leading accelerator and venture capital providing mentorship and funding to companies across all sectors.",
#   "Founders"=>"Jessica Livingston, Lucas Thomaz, Paul Graham, Raffaele Colella, Robert Morris, Trevor Blackwell",
#   "Industries"=>"Enterprise, SaaS, Big Data & Analytics, Productivity, DTC, Cybersecurity, Supply Chain & Logistics, Education, Consumer, Food & Beverage, Gaming, Future of Work, Social, Transportation, Travel & Hospitality, AR & VR, Healthcare, Health & Wellness, Biotech, Fintech, InsurTech, Industrial, Aerospace & Space, Climate & Sustainability, Robotics, Government Technology, Manufacturing, Infrastructure, Legal, Marketing, Agriculture, Automative, Energy",
#   "Link"=>"https://ycombinator.com/",
#   "Stages"=>"Seed, Early Stage, Pre-Seed, Series A",
#   "Minimum Check Size"=>"$500,000",
#   "Number of Investments"=>444,
#   "Number of Exits"=>4469,
#   "Remarkable Investments"=>"Coinbase, Twitch, Reddit"
# }

investor_photos = [
 "https://images.unsplash.com/photo-1619358494796-212138ae5df3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjQzfHxidXNpbmVzcyUyMHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1648484099728-5acd3101b8e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTY5fHxidXNpbmVzcyUyMHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573167627769-e201a7ddf409?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjAxfHxlbnRyZXByZW5ldXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1589386417686-0d34b5903d23?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjU3fHxlbnRyZXByZW5ldXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573497019707-1c04de26e58c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjY5fHxlbnRyZXByZW5ldXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://plus.unsplash.com/premium_photo-1661281289904-a347b6c5ea4c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjgwfHxlbnRyZXByZW5ldXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573165850883-9b0e18c44bd2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjg4fHxlbnRyZXByZW5ldXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1551836022-deb4988cc6c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NDV8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1613473350016-1fe047d6d360?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzl8fGJ1c2luZXNzJTIwcG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://plus.unsplash.com/premium_photo-1661284837474-58ca893cc879?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjkyfHxlbnRyZXByZW5ldXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1648474484044-bb82df2f5a1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjQ2fHxidXNpbmVzcyUyMHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1625249927451-ba4973d5b222?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODR8fHdvcmslMjBwbGFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1572274407649-6cb883740677?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzExfHxlbnRyZXByZW5ldXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1655249493799-9cee4fe983bb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjcyfHxidXNpbmVzcyUyMHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573497019418-b400bb3ab074?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzEyfHxlbnRyZXByZW5ldXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://plus.unsplash.com/premium_photo-1661284828986-b565e6b13fd2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDI0fHxlbnRyZXByZW5ldXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1648484099915-b72a39454f68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjI3fHxidXNpbmVzcyUyMHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
 "https://plus.unsplash.com/premium_photo-1663011410518-3421bc33f8f7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODV8fHdvcmslMjBwbGFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573166475912-1ed8b4f093d2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDM0fHxlbnRyZXByZW5ldXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1655249481446-25d575f1c054?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTAwN3x8YnVzaW5lc3MlMjBwb3J0cmFpdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://plus.unsplash.com/premium_photo-1661277712617-1e46eac647e8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDQyfHxlbnRyZXByZW5ldXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1665224752136-4dbe2dfc8195?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTE0NHx8YnVzaW5lc3MlMjBwb3J0cmFpdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1644442146822-97c05b44e45d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTE0MXx8YnVzaW5lc3MlMjBwb3J0cmFpdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1504384308090-c894fdcc538d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHdvcmslMjBwbGFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1610896011476-300d6239d995?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTI2Nnx8YnVzaW5lc3MlMjBwb3J0cmFpdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1620246499808-d9fe1b7858dc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTI3OHx8YnVzaW5lc3MlMjBwb3J0cmFpdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1627161684458-a62da52b51c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTMxNXx8YnVzaW5lc3MlMjBwb3J0cmFpdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1625504615927-c14f4f309b63?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTM0Mnx8YnVzaW5lc3MlMjBwb3J0cmFpdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://plus.unsplash.com/premium_photo-1661281203773-833d30e370ee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTMyfHxlbnRyZXByZW5ldXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1668271165626-76156f291c4a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTU0NHx8YnVzaW5lc3MlMjBwb3J0cmFpdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1554435493-93422e8220c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YnVpbGRpbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1550071593-fd1bdaf1f93c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTMwfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTUwfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1531482615713-2afd69097998?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MjMxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1543269865-0a740d43b90c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MjY0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1521737852567-6949f3f9f2b5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MzYxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1531497865144-0464ef8fb9a9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NDQxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmVzc2lvbmFsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1580894732444-8ecded7900cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmVzc2lvbmFsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1590650516494-0c8e4a4dd67e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHByb2Zlc3Npb25hbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573496527892-904f897eb744?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fHByb2Zlc3Npb25hbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573497019236-17f8177b81e8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fHByb2Zlc3Npb25hbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1590650153855-d9e808231d41?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fHByb2Zlc3Npb25hbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573496799515-eebbb63814f2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHByb2Zlc3Npb25hbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1581065178047-8ee15951ede6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTN8fHByb2Zlc3Npb25hbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1562788869-4ed32648eb72?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTl8fHByb2Zlc3Npb25hbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1551434678-e076c223a692?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjJ8fHByb2Zlc3Npb25hbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1624555130882-dcfa8ecb17ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzd8fHByb2Zlc3Npb25hbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1557804506-669a67965ba0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA4fHxwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573165850883-9b0e18c44bd2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTEyfHxwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1508243529287-e21914733111?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTIzfHxwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1551836022-4c4c79ecde51?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTI5fHxwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTQwfHxwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1590650213165-c1fef80648c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTUzfHxwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1590650046871-92c887180603?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTQ5fHxwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1551836022-d5d88e9218df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTcxfHxwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1612116144183-d1ba477239f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTc2fHxwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1524758870432-af57e54afa26?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTk4fHxwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573496774426-fe3db3dd1731?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjA3fHxwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573497701175-00c200fd57f0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzExfHxwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1631306006348-f9ed42b1e19a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzQ0fHxwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDY2fHxwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1600880292203-757bb62b4baf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHdvcmt8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1570126618953-d437176e8c79?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y29tcGFueXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1462206092226-f46025ffe607?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Y29tcGFueXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1560264280-88b68371db39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
 "https://images.unsplash.com/photo-1542744173-8e7e53415bb0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGNvbXBhbnl8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1606836591695-4d58a73eba1e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fGNvbXBhbnl8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1470075801209-17f9ec0cada6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fGNvbXBhbnl8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573165231977-3f0e27806045?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzJ8fGNvbXBhbnl8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1551836022-aadb801c60ae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTc4fHxjb21wYW55fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1603117791031-bed60a5acbe1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODZ8fHdvcmslMjBwbGFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1577415124269-fc1140a69e91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTl8fGJ1c2luZXNzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1541746972996-4e0b0f43e02a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTE2fHxidXNpbmVzc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1567450475250-21f5b6d98021?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTM3fHxidXNpbmVzc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573167243872-43c6433b9d40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDl8fGVudHJlcHJlbmV1cnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1624797432677-6f803a98acb3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjF8fGVudHJlcHJlbmV1cnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573496130103-a442a3754d0e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjZ8fGVudHJlcHJlbmV1cnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
 "https://images.unsplash.com/photo-1573496130141-209d200cebd8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODF8fGVudHJlcHJlbmV1cnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"
]
counter = 0
investors.each do |investor|
  # if investor["Founders"].empty?
  #   first_name, last_name = investor["Founders"].split(",")[0].split
  # else
  # end
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

    inv = Investor.create!(
      first_name: first_name,
      last_name: last_name,
      company_name: investor["Name"],
      company_description: investor["Description"],
      company_email: "#{investor["Name"].gsub(/\s/, "").downcase}@gmail.com",
      company_UEN: "202#{rand(2...3)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}X",
      funding_stage: investor["Stages"],
      ticket_size: investor["Minimum Check Size"].empty? ? "$100,000" : investor["Minimum Check Size"],
      # sectors: ["Education", "Enterprise", "SaaS", "Big Data & Analytics", "Productivity", "Cybersecurity", "Supply Chain & Logistics", "Consumer", "Food & Beverage", "Future of Work", "Transportation", "Travel & Hospitality", "Healthcare", "AR & VR", "Health & Wellness", "Insuretech", "Aerospace & Space", "Climate & Sustainability"].sample(3)
    )

  file = URI.open(investor_photos[counter])

  inv.photo.attach(io: file, filename: "#{first_name}.jpg", content_type: "image/jpg")

  # avatar_url = "https://example.com/avatar.jpg"
  # avatar_file = URI.open(avatar_url)
  # investor.avatar.attach(io: avatar_file, filename: "#{company_name}.jpg")

  inv.sectors = sectors.sample(3)

  inv.save!
  counter += 1

  puts "#{first_name} #{last_name} created!"
end

file7 = URI.open("https://wnws.com/wp-content/uploads/2022/02/36946182_10156679039529201_2603626432013795328_n.jpg")

investor = Investor.new(
  first_name: "Takuya Kimura",
  last_name: "Electronic",
  company_name: "Toyoto Elc",
  company_description: "Toyoto Elc is a Japanese multinational automotive manufacturer headquartered in Toyoto City, Aichi, Japan. ",
  company_email: "toyoto_elc@gmail.com",
  company_UEN: "200598765R",
  funding_stage: "Growth",
  ticket_size: "$1000000",
)
investor.photo.attach(io: file7, filename: "investor.jpg", content_type: "image/jpg")
investor.sectors = sectors.sample(3)
investor.save!
