class EmergencyContact < ApplicationRecord
  belongs_to :site

  validates :name, presence: true
  validates :phone, presence: true

  CATEGORIES = [
    "Barangay",
    "Police (PNP)",
    "Fire (BFP)",
    "Rescue / MDRRMO",
    "Hospital / Health",
    "Municipal / City Hall",
    "Utilities",
    "Other"
  ].freeze

  COMMON_CONTACTS = [
    { name: "National Emergency Hotline", phone: "911", category: "Other" },
    { name: "Philippine National Police (PNP)", phone: "117", category: "Police (PNP)" },
    { name: "Bureau of Fire Protection (BFP)", phone: "(02) 8426-0219", category: "Fire (BFP)" },
    { name: "Philippine Red Cross", phone: "143", category: "Rescue / MDRRMO" },
    { name: "NDRRMC Operations Center", phone: "(02) 8911-5061", category: "Rescue / MDRRMO" },
    { name: "DOH Hotline", phone: "1555", category: "Hospital / Health" },
    { name: "DSWD Hotline", phone: "16545", category: "Other" },
  ].freeze

  default_scope { order(:sort_order) }
end
