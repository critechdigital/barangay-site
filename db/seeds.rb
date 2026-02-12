# Demo Barangay Seed Data
puts "Seeding demo data..."

# Create demo user
demo_user = User.find_or_create_by!(email: "demo@barangaysite.ph") do |u|
  u.name = "Demo Admin"
  u.password = "demo1234"
  u.password_confirmation = "demo1234"
  u.role = :admin
end

# Create demo site
site = Site.find_or_create_by!(slug: "barangay-san-isidro") do |s|
  s.user = demo_user
  s.name = "Barangay San Isidro"
  s.tagline = "Isang progresibo at mapayapang barangay"
  s.region = "NCR"
  s.province = "Metro Manila"
  s.municipality = "Quezon City"
  s.barangay = "San Isidro"
  s.subdomain = "san-isidro"
  s.phone = "(02) 8123-4567"
  s.email = "brgy.sanisidro@gmail.com"
  s.address = "123 Rizal Avenue, Brgy. San Isidro, Quezon City, Metro Manila"
  s.office_hours = "Monday - Friday, 8:00 AM - 5:00 PM | Saturday, 8:00 AM - 12:00 PM"
  s.primary_color = "#1d4ed8"
  s.secondary_color = "#3b82f6"
  s.published = true
end

# Officials
officials_data = [
  { name: "Hon. Roberto M. Santos", position: "Punong Barangay (Captain)", sort_order: 0 },
  { name: "Kag. Maria Teresa L. Reyes", position: "Barangay Kagawad", sort_order: 1 },
  { name: "Kag. Jose P. Garcia", position: "Barangay Kagawad", sort_order: 2 },
  { name: "Kag. Ana Marie D. Cruz", position: "Barangay Kagawad", sort_order: 3 },
  { name: "Kag. Ricardo F. Mendoza", position: "Barangay Kagawad", sort_order: 4 },
  { name: "Kag. Lorna S. Villanueva", position: "Barangay Kagawad", sort_order: 5 },
  { name: "Kag. Eduardo T. Ramos", position: "Barangay Kagawad", sort_order: 6 },
  { name: "Kag. Patricia N. Bautista", position: "Barangay Kagawad", sort_order: 7 },
  { name: "Elena R. Flores", position: "Barangay Secretary", sort_order: 8 },
  { name: "Miguel A. Torres", position: "Barangay Treasurer", sort_order: 9 },
  { name: "SK Chair. Sofia G. Dela Rosa", position: "SK Chairperson", sort_order: 10 },
]

officials_data.each do |data|
  site.officials.find_or_create_by!(name: data[:name]) do |o|
    o.position = data[:position]
    o.sort_order = data[:sort_order]
  end
end

# Services
Site::COMMON_SERVICES.each_with_index do |svc, i|
  site.services.find_or_create_by!(name: svc[:name]) do |s|
    s.category = svc[:category]
    s.fees = svc[:fees]
    s.processing_time = svc[:processing_time]
    s.requirements = svc[:requirements]
    s.sort_order = i
  end
end

# Extra services
extra_services = [
  { name: "Senior Citizen ID", category: "Social Services", fees: "Free", processing_time: "3-5 days", requirements: "Birth certificate, 1x1 photo, Valid ID", sort_order: 10 },
  { name: "Solo Parent ID", category: "Social Services", fees: "Free", processing_time: "5 days", requirements: "DSWD certification, Valid ID, Birth cert of child", sort_order: 11 },
  { name: "Health Certificate", category: "Health", fees: "₱100", processing_time: "1 day", requirements: "Valid ID", sort_order: 12 },
]

extra_services.each do |svc|
  site.services.find_or_create_by!(name: svc[:name]) do |s|
    s.category = svc[:category]
    s.fees = svc[:fees]
    s.processing_time = svc[:processing_time]
    s.requirements = svc[:requirements]
    s.sort_order = svc[:sort_order]
  end
end

# Announcements
announcements_data = [
  {
    title: "Quarterly Barangay Assembly — March 15, 2026",
    body: "All residents of Barangay San Isidro are cordially invited to attend the Quarterly Barangay Assembly on March 15, 2026, at 2:00 PM at the Barangay Hall.\n\nAgenda:\n- State of the Barangay Address\n- Budget Report Q1 2026\n- Community Development Projects Update\n- Open Forum\n\nRefreshments will be served. Your attendance and participation are highly encouraged.",
    published: true,
    published_at: 2.days.ago
  },
  {
    title: "Free Medical Mission — March 22, 2026",
    body: "In partnership with the Quezon City Health Department, Barangay San Isidro will hold a FREE Medical Mission on March 22, 2026, from 8:00 AM to 4:00 PM at the covered court.\n\nServices available:\n- General consultation\n- Blood pressure screening\n- Blood sugar testing\n- Dental check-up\n- Free medicines\n\nPlease bring your Barangay ID or any valid ID. First come, first served.",
    published: true,
    published_at: 1.day.ago
  },
  {
    title: "Barangay Clearance Processing Hours Update",
    body: "Effective immediately, Barangay Clearance processing will follow new hours:\n\nMonday to Friday: 8:00 AM - 4:30 PM (last transaction at 4:00 PM)\nSaturday: 8:00 AM - 11:30 AM (last transaction at 11:00 AM)\n\nPlease bring a valid ID and Community Tax Certificate (Cedula). Processing takes approximately 15-30 minutes.",
    published: true,
    published_at: 3.days.ago
  },
]

announcements_data.each do |data|
  site.announcements.find_or_create_by!(title: data[:title]) do |a|
    a.body = data[:body]
    a.published = data[:published]
    a.published_at = data[:published_at]
  end
end

puts "Demo data seeded!"
puts "  User: demo@barangaysite.ph / demo1234"
puts "  Site: /sites/barangay-san-isidro"
puts "  Officials: #{site.officials.count}"
puts "  Services: #{site.services.count}"
puts "  Announcements: #{site.announcements.count}"
