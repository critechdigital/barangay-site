class Service < ApplicationRecord
  belongs_to :site
  has_many :service_steps, -> { order(:step_number) }, dependent: :destroy

  accepts_nested_attributes_for :service_steps, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true

  CATEGORIES = ["Certificates", "Business", "Protection", "Peace & Order", "Health", "Social Services", "Other"].freeze
end
