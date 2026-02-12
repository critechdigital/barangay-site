class Document < ApplicationRecord
  belongs_to :site

  validates :title, presence: true
  validates :category, presence: true

  CATEGORIES = [
    "Budget Documents",
    "Annual Investment Plan",
    "Statement of Receipts & Expenditures",
    "Procurement / Bidding",
    "Trust Fund Utilization",
    "Barangay Ordinances",
    "Barangay Resolutions",
    "Downloadable Forms",
    "Annual Reports",
    "Other"
  ].freeze

  scope :published, -> { where(published: true).order(:sort_order) }
  scope :by_category, ->(cat) { where(category: cat) }
end
