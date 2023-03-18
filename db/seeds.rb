# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts " Cleaning database..."

User.destroy_all

puts "Creating users"

# TODO: Creating user (one user)

User.create!(first_name: "Julie", last_name: "Goh", email: "juliegoh@gmail.com", password:"testing" )

# TODO: Creating founder(one company_profile)

Founder.create!(company_name: "CP Ventures", company_description: "Autio is an app that entertains listeners with bite-sized audio stories about history, landmarks, culture, and natural wonders for travel. Users can explore nearby stories based on their current location once they enable location access. When users are not driving, they can view a map of the United States and select stories based on theirinterests. The app also offers entertaining and educational content for RVers to enjoy while traveling across the country.", company_email: "info@autio.com", company_UEN: "202345789X", funding_stage: "Seed", date_incorported: "01.12.2023")

# TODO: Creating 5 investors (investor_profile)

Investor.create!(first_name: "Lucas", last_name: "Thomaz", company_name: "Y Combinator", company_description: "Y Combinator is a leading accelerator and venture capital providing mentorship and funding to companies across all sectors.", company_email: "YCombinator@gmail.com", company_UEN: "202312345X", funding_stage:"Seed, Early Stage, Pre-Seed, Series A", ticket_size:"$500,000" )
Investor.create!(first_name: "Paul", last_name: "Graham", company_name: "Alumni Ventures Group", company_description: "Alumni Ventures co-invest in companies invested by other established venture capital firms across diverse industries, stages and regions.", company_email:"AlumniVentures@gmail.com", company_UEN: "202313756X", funding_stage: "Early Stage, Late Stage, Seed", ticket_size: "$250,000")
Investor.create!(first_name: "Robert", last_name: "Morris", company_name: "Battery Ventures", company_description: "Batter is a VC firm investing in technology companies worldwide, from startups to established market leaders.", company_email: "BatteryVentures@gmail.com", company_UEN: "202386935X", funding_stage: "Early Stage, Late Stage, Seed, Debt, Private Equity", ticket_size: "$1,000,000")
Investor.create!(first_name: "Trevor", last_name: "Blackwell", company_name: "Enterprise Ireland", company_description: "Enterprise Ireland is a government organisation that provides investment support and opportunities for founders looking to build their businesses in Ireland.", company_email: "EnterpriseIre@gmail.com", company_UEN: "202245602X",funding_stage: "Pre-Seed, Seed, Series A, Series B, Series C",ticket_size: "€50,000")
Investor.create!(first_name: "Jessica", last_name: "Livingston", company_name: "High-Tech Gründerfonds", company_description: "HTGF is a German seed-stage investor funding startups in industrial tech, life sciences and digital tech.", company_email: "Gründerfonds@gmail.com", company_UEN: "202278902X", funding_stage: "Seed, Early Stage", ticket_size: "€1,000,000")

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
