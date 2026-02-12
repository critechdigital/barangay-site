class FoiRequest < ApplicationRecord
  belongs_to :site

  enum :status, { received: 0, processing: 1, released: 2, denied: 3 }

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :description, presence: true
  validates :purpose, presence: true

  before_create :generate_tracking_number
  before_create :set_received_at

  scope :recent, -> { order(created_at: :desc).limit(20) }

  def status_badge_color
    case status
    when "received" then "bg-yellow-100 text-yellow-800"
    when "processing" then "bg-blue-100 text-blue-800"
    when "released" then "bg-green-100 text-green-800"
    when "denied" then "bg-red-100 text-red-800"
    end
  end

  private

  def generate_tracking_number
    self.tracking_number = "FOI-#{site_id}-#{Time.current.strftime('%Y%m%d')}-#{SecureRandom.hex(3).upcase}"
  end

  def set_received_at
    self.received_at = Time.current
  end
end
