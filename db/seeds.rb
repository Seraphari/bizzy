require 'json'
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts " Cleaning database..."

Founder.destroy_all
Investor.destroy_all
Sector.destroy_all
User.destroy_all

puts "Creating users"

# TODO: Creating user (one user)

user = User.create!(
  first_name: "Julie",
  last_name: "Goh",
  email: "juliegoh@gmail.com",
  password:"testing"
)

# TODO: Creating founder(one company_profile)

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
    ticket_size: investor["Minimum Check Size"].empty? ? "$100,000" : investor["Minimum Check Size"]
  )

  puts "#{first_name} created!"
end

# Investor.create!(first_name: "Barrick", last_name: "Rothchild", company_name: "Alumni Ventures Group", company_description: "Alumni Ventures co-invest in companies invested by other established venture capital firms across diverse industries, stages and regions.", company_email:"AlumniVentures@gmail@gmail.com.com", company_UEN: "202313756X", funding_stage: "Early Stage, Late Stage, Seed", ticket_size: "$250,000")
# Investor.create!(first_name: "Rick", last_name: "Frisbie", company_name: "Battery Ventures", company_description: "Batter is a VC firm investing in technology companies worldwide, from startups to established market leaders.", company_email: "BatteryVentures@gmail.com", company_UEN: "202386935X", funding_stage: "Early Stage, Late Stage, Seed, Debt, Private Equity", ticket_size: "$1,000,000")
# Investor.create!(first_name: "", last_name: "", company_name: "Enterprise Ireland", company_description: "Enterprise Ireland is a government organisation that provides investment support and opportunities for founders looking to build their businesses in Ireland.", company_email: "EnterpriseIre@gmail.com", company_UEN: "202245602X",funding_stage: "Pre-Seed, Seed, Series A, Series B, Series C",ticket_size: "€50,000")
# Investor.create!(first_name: "Alexander Von", last_name: "Frankenberg", company_name: "High-Tech Gründerfonds", company_description: "HTGF is a Germlakestar@gmail.coman seed-stage investor funding startups in industrial tech, life sciences and digital tech.", company_email: "Gründerfonds@gmail.com", company_UEN: "202278902X", funding_stage: "Seed, Early Stage", ticket_size: "€1,000,000")
# Investor.create!(first_name: "", last_name: "", company_name: "BDC Venture Capital", company_description: "BDC Venture Capital is one of Canada's most active VC firms with themed funds to support startups across multiple sectors.", company_email: "bdcventure@gmail.com", company_UEN: "202298670X", funding_stage: "Late Stage, Early Stage, Seed, Series A, Series B", ticket_size: "")
# Investor.create!(first_name: "Gaëtan", last_name: "Servais", company_name: "Noshaq", company_description: "Noshaq is a Belgium venture fund focusing on biotech, digital, industry 4.0, real estate, agri-food, culture & creative and energy & sustainability industries.", company_email: "Noshaq@gmail.com", company_UEN: "202224357X", funding_stage: "Early Stage", ticket_size: "")
# Investor.create!(first_name: "Matt", last_name: "Ocko", company_name: "Data Collective", company_description: "DCVC is a deep tech venture capital investing in seed, series A, and growth stage companies based in the US.", company_email: "datacollective", company_UEN: "202293673X", funding_stage: "Seed, Series A", ticket_size: "")
# Investor.create!(first_name: "Noel", last_name: "Fenton", company_name: "Trinity Ventures", company_description: "Trinity Ventures is an early-stage venture capital firm investing in cloud computing, SaaS and technology sectors.", company_email: "trinityventures@gmail.com", company_UEN: "202235173X", funding_stage: "Seed, Series A, Series B", ticket_size: "$500,000")
# Investor.create!(first_name: "Joe", last_name: "Aragona", company_name: "Austin Ventures", company_description: "With a regional focus in Texas, AV invests in early-stage and mid-market companies by sharing expertise with executives and entrepreneurs.", company_email: "austinventures@gmail.com", company_UEN: "202248901X", funding_stage: "Early Stage, Late Stage, Seed, Private Equity", ticket_size: "$500,000")
# Investor.create!(first_name: "Duncan", last_name: "Turner", company_name: "HAX", company_description: "HAX is a hard tech venture capital firm with residency programs for pre-seed funding.", company_email: "hax@gmail.com", company_UEN: "202217462X", funding_stage: "Pre-Seed", ticket_size: "$250,000")
# Investor.create!(first_name: "Daniel", last_name: "Keiper-Knorr", company_name: "Speedinvest", company_description: "Speedinvest is a venture financing firm that backs pre-seed, seed, and early-stage technology companies.", company_email: "speedinvest@gmil.com", company_UEN: "202278321X", funding_stage: "Early Stage, Seed, Pre-Seed", ticket_size: "€700,000")
# Investor.create!(first_name: " Mahn", last_name: "Soon", company_name: "Korea Investment Partners", company_description: "Korea Investment Partners is a corporate venture fund for early to growth stages companies in Asia.", company_email: "koreainvestmentpartners@gmail.com", company_UEN: "202247810X", funding_stage: "Series A, Series B, Series C", ticket_size: "$5,000,000")
# Investor.create!(first_name: "Xavier Álvarez", last_name: "Forn", company_name: "Caixa Capital", company_description: "Caixa Capital Risc is a Spanish venture capital investing in three main themes: Information Technology, Life Sciences, and Industrial Technologies.", company_email: "caixacapital@gmail.com", company_UEN: "202278131X", funding_stage: "Seed, Series A", ticket_size: "€250,000")
# Investor.create!(first_name: "Thaddeus F.", last_name: "Walkowicz", company_name: "Advanced Technology Ventures", company_description: "Founded in 1979, Advanced Technology Ventures (ATV) is a venture capital investing in technology, healthcare, and cleantech companies.", company_email: "advancedtechnologyventures@gmail.com", company_UEN: "202278911X", funding_stage: "Early Stage, Late Stage, Seed, Debt", ticket_size: "$10,000,000")
# Investor.create!(first_name: "Oscar", last_name: "Kneppers", company_name: "Rockstart", company_description: "Rockstart focuses on pre-seed to series B investment opportunities in energy, agrifood and emerging tech domains.", company_email: "rockstart@gmail.com", company_UEN: "202245614X", funding_stage: "Early Stage, Seed, Series A, Series B, Pre-Seed", ticket_size: "€100,000")
# Investor.create!(first_name: "Jacob", last_name: "Key", company_name: "Industrifonden", company_description: "Luminar Ventures is a Swedish venture capital primarily investing in Nordic tech companies at their seed stage.", company_email: "industrifonden@gmail.com", company_UEN: "202283271X", funding_stage: "Wercker, Hubs, iClinic", ticket_size: "$1,000,000")
# Investor.create!(first_name: "Oliver", last_name: "Borrmann", company_name: "bmp Ventures", company_description: "bmp is a German venture capital firm seeking investments in tech companies.", company_email: "bmpventures@gmail.com", company_UEN: "202236819X", funding_stage: "Seed, Early Stage, Late Stage, Series A, Growth", ticket_size: "€1,500,000")
# Investor.create!(first_name: "Florian", last_name: "Schweitzer", company_name: "btov Partners", company_description: "Btov Partners is a venture capital firm investing in European founders since 2000.", company_email: "btovpartners@gmail.com", company_UEN: "202230912X", funding_stage: "Early Stage, Seed, Series A", ticket_size: " €250,000")
# Investor.create!(first_name: "Viktoriya", last_name: "Tigipko", company_name: "TA Venture", company_description: "TA Ventures is a seed and series A venture capital firm with investments in the US and Europe markets.", company_email: "taventure@gmail.com", company_UEN: "202241782X", funding_stage: "Early Stage, Seed", ticket_size: "$100,000")
# Investor.create!(first_name: "Gert", last_name: "Kohler", company_name: "Creathor", company_description: "Creathor Ventures seeks investments in Swedish and German companies building in the fields of technology and healthcare.", company_email: "creathor@gmail.com", company_UEN: "202245026X", funding_stage: "Early Stage, Late Stage, Seed", ticket_size: "")
# Investor.create!(first_name: "Michel", last_name: "David-Weill", company_name: "Eurazeo", company_description: "Eurazeo is an investment firm providing initial to Series C deals to digital services and technologies companies.", company_email: "eurazeo@gmail.com", company_UEN: "202294684X", funding_stage: "Early Stage, Series C, Seed, Series A, Series B", ticket_size: "")
# Investor.create!(first_name: "Ben", last_name: "Rosen", company_name: "Sevin Rosen Funds", company_description: "Sevin Rosen Funds is a Texas-based VC firm investing in tech companies.", company_email: "sevinrosenfunds@gmail.com", company_UEN: "202267893X", funding_stage: "Late Stage, Early Stage, Debt", ticket_size: "$250,000")
# Investor.create!(first_name: "Niklas", last_name: "Zennström", company_name: "Atomico Ventures", company_description: "Atomico is a venture capital primarily focused on investing in European companies entering their growth stage.", company_email: "atomicoventures@gmail.com", company_UEN: "202235675X", funding_stage: "Early Stage, Late Stage, Private Equity", ticket_size: "£250,000")
# Investor.create!(first_name: "Trevor", last_name: "Kienzle", company_name: "Correlation Ventures", company_description: "Correlation Ventures is an American venture capital that co-invest in US-founded companies.", company_email: "correlationventures@gmail.com", company_UEN: "202274682X", funding_stage: "Seed, Series A, Growth", ticket_size: "$100,000")
# Investor.create!(first_name: "Mika", last_name: "Salmi", company_name: "Lakestar", company_description: "Lakestar provides seed to growth capital for European tech companies.", company_email: "lakestar@gmail.com", company_UEN: "202257823X", funding_stage: "Seed, Growth, Early Stage", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")
# Investor.create!(first_name: "", last_name: "", company_name: "", company_description: "", company_email: "", company_UEN: "", funding_stage: "", ticket_size: "")

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


# wankoon = Investor.create!(email: "wankoon@gmail.com", password: "testing")
# vivian = Investor.create!(email: "vivian@gmail.com", password: "testing")
# jufri = Investor.create!(email: "jufri@gmail.com", password: "testing")
# yuelong = Investor.create!(email: "yuelong@gmail.com", password: "testing")
