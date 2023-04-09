require 'json'
require 'faker'

puts " Cleaning database..."

Founder.destroy_all
Investor.destroy_all
Sector.destroy_all
User.destroy_all

puts "Creating users"

user = User.create!(
  first_name: "Julie",
  last_name: "Goh",
  email: "juliegoh@gmail.com",
  password:"testing"
)

Founder.create!(
  user: user,
  company_name: "CP Ventures",
  company_description: "Autio is an app that entertains listeners with bite-sized audio stories about history, landmarks, culture, and natural wonders for travel. Users can explore nearby stories based on their current location once they enable location access. When users are not driving, they can view a map of the United States and select stories based on theirinterests. The app also offers entertaining and educational content for RVers to enjoy while traveling across the country.",
  company_email: "info@autio.com",
  company_UEN: "202345789X",
  funding_stage: "Seed",
  date_incorporated: "01.12.2023"
)

# TODO: Creating 5 investors (investor_profile)
# load the investors.json file into memory
investors_json = File.read(File.join(__dir__, 'investors.json'))
# parse the json file as ruby
investors = JSON.parse(investors_json)

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
investors.each do |investor|
  # if investor["Founders"].empty?
  #   first_name, last_name = investor["Founders"].split(",")[0].split
  # else
  # end
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

    Investor.create!(
      first_name: first_name,
      last_name: last_name,
      company_name: investor["Name"],
      company_description: investor["Description"],
      company_email: "#{investor["Name"].gsub(/\s/, "").downcase}@gmail.com",
      company_UEN: "202#{rand(2...3)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}X",
      funding_stage: investor["Stages"],
      ticket_size: investor["Minimum Check Size"].empty? ? "$100,000" : investor["Minimum Check Size"],
      sectors: ["Education", "Enterprise", "SaaS", "Big Data & Analytics", "Productivity", "Cybersecurity", "Supply Chain & Logistics", "Consumer", "Food & Beverage", "Future of Work", "Transportation", "Travel & Hospitality", "Healthcare", "AR & VR", "Health & Wellness", "Insuretech", "Aerospace & Space", "Climate & Sustainability"].sample(3)
    )

  puts "#{first_name} created!"
end

# TODO: Creating 5 sectors
Sector.create!(name: "Education")
Sector.create!(name: "Enterprise")
Sector.create!(name: "SaaS")
Sector.create!(name: "Big Data & Analytics")
Sector.create!(name: "Productivity")
Sector.create!(name: "Cybersecurity")
Sector.create!(name: "Supply Chain & Logistics")
Sector.create!(name: "Consumer")
Sector.create!(name: "Food & Beverage")
Sector.create!(name: "Future of Work")
Sector.create!(name: "Transportation")
Sector.create!(name: "Travel & Hospitality")
Sector.create!(name: "Healthcare")
Sector.create!(name: "AR & VR")
Sector.create!(name: "Health & Wellness")
Sector.create!(name: "InsurTech")
Sector.create!(name: "Aerospace & Space")
Sector.create!(name: "Climate & Sustainability")
