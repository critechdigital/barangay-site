class Site < ApplicationRecord
  belongs_to :user
  has_many :officials, -> { order(:sort_order) }, dependent: :destroy
  has_many :services, -> { order(:sort_order) }, dependent: :destroy
  has_many :announcements, dependent: :destroy
  has_many :pages, -> { order(:sort_order) }, dependent: :destroy

  accepts_nested_attributes_for :officials, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :services, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true, format: { with: /\A[a-z0-9\-]+\z/ }
  validates :subdomain, uniqueness: true, allow_blank: true

  before_validation :generate_slug, if: -> { slug.blank? && name.present? }

  # Pre-loaded barangay services checklist
  COMMON_SERVICES = [
    { name: "Barangay Clearance", category: "Certificates", fees: "₱50-100", processing_time: "1 day", requirements: "Valid ID, Cedula" },
    { name: "Certificate of Indigency", category: "Certificates", fees: "Free", processing_time: "1 day", requirements: "Valid ID" },
    { name: "Certificate of Residency", category: "Certificates", fees: "₱50", processing_time: "1 day", requirements: "Valid ID, Proof of residence" },
    { name: "Cedula / Community Tax Certificate", category: "Certificates", fees: "Varies", processing_time: "Immediate", requirements: "Valid ID" },
    { name: "Barangay Business Clearance", category: "Business", fees: "₱200-500", processing_time: "1-3 days", requirements: "DTI/SEC Registration, Valid ID" },
    { name: "Barangay Protection Order", category: "Protection", fees: "Free", processing_time: "Immediate", requirements: "Complaint affidavit" },
    { name: "Blotter / Incident Report", category: "Peace & Order", fees: "Free", processing_time: "Immediate", requirements: "None" },
    { name: "Mediation / Lupong Tagapamayapa", category: "Peace & Order", fees: "Free", processing_time: "Scheduled", requirements: "Complaint" },
  ].freeze

  OFFICIAL_POSITIONS = [
    "Punong Barangay (Captain)",
    "Barangay Kagawad",
    "Barangay Secretary",
    "Barangay Treasurer",
    "SK Chairperson",
    "SK Kagawad",
  ].freeze

  scope :published, -> { where(published: true) }

  def public_url
    subdomain.present? ? "#{subdomain}.barangaysite.ph" : "barangaysite.ph/#{slug}"
  end

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
